//
//  LoginVC.swift
//  MVVMDemo
//
//  Created by 周文杰 on 2017/1/22.
//  Copyright © 2017年 zwj. All rights reserved.
//

import UIKit

import ReactiveCocoa
import ReactiveSwift
import Result

class LoginVC: UIViewController {

    @IBOutlet var phoneTF: UITextField!
    @IBOutlet var pwdTF: UITextField!
    @IBOutlet var loginBTN: UIButton!
    @IBOutlet var loadingView: LoadingView!
    
    var viewModel:LoginVM = LoginVM()
    var isComplete = MutableProperty(false)
    
    internal static func create() -> LoginVC {
        let storyboardIdentifier = self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
        guard
            let vc = UIStoryboard(name: "Login", bundle: Bundle(for: LoginVC.self))
                .instantiateViewController(withIdentifier: storyboardIdentifier) as? LoginVC
            else { fatalError("Couldn't instantiate \(storyboardIdentifier) from Login") }
        return vc;
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBTN.isEnabled = false;

        self.bindData()
    }

    // MARK: - ***Bind Data***

    private func bindData(){
        self.bindingTextField()
        self.bindingLoadingView()
//        self.bindingLoginButton()
    }
    
    func bindingLoadingView(){
        
        self.viewModel.loadingSignal.output.observeValues { (showLoading: Bool) in
            self.loadingView.showLoading(showLoading)
        }
    }
    
    func bindingLoginButton(){
        
//        viewModel.actionLogin.events.observeValues({ (event :Event<Any, VTMError>) in
//            switch event{
//            case .failed(let error):
//                switch error{
//                case .ORMBizError( _,let msg):
//                    self.alert(msg!)//TODO:
//                default:
//                    break
//                }
//            default:
//                break
//            }
//        })
//        loginBTN.reactive.pressed = CocoaAction(viewModel.actionLogin , input: loginBTN)
        
    }
    
    @IBAction func onPressLogin(_ sender: Any) {
        viewModel.input.doLoginCommand().observe(Observer{ [weak self] event in
            switch event{
            case .completed:
                self?.loginComplete()
            case .failed(let err):
                self?.alert(err.errorMessage!)
            default:
                break
            }
            
        }, during: self.reactive.lifetime)
    
    }
    
    
    func bindingTextField(){
        let phoneSig = phoneTF!.reactive.continuousTextValues.map {
            $0?.characters.count ?? 0
        }
        
        let pwdSig = pwdTF!.reactive.continuousTextValues.map {
            ($0?.characters.count)!
        }
        
        phoneSig.combineLatest(with: pwdSig).map { (phoneLength, pwdLength) -> Bool in
            phoneLength == 11 && pwdLength >= 6
        }.map({ isButtonOK -> Bool in
            self.loginBTN?.isEnabled = isButtonOK
            return isButtonOK
        }).filter { $0 }.observeValues{_ in 
            self.viewModel.setUserName(self.phoneTF.text!)
            self.viewModel.setPassword(self.pwdTF.text!)
        }
        
        //.logEvents(identifier: "✨My awesome stream ✨")
    }

    func alert(_ msg: String) -> Void {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "错误", message:msg, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        //self.presentViewController(alert, animated: true, completion: nil)
    }

    func loginComplete() -> Void {
        isComplete.value = true
    }
}
