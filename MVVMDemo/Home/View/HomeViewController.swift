//
//  RootViewController.swift
//  MVVMDemo
//
//  Created by 周文杰 on 2017/1/22.
//  Copyright © 2017年 zwj. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result

typealias cellTransform = (_ cell:UITableViewCell, _ indexPath: IndexPath) -> Void

class HomeViewController: UIViewController {

    var viewModel = HomeViewModel()
    var cellsCount = MutableProperty(0)
    
    @IBOutlet weak var tableView: UITableView!
    
    internal static func create() -> HomeViewController {
        let storyboardIdentifier = self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
        guard
            let vc = UIStoryboard(name: "Home", bundle: Bundle(for: HomeViewController.self))
                .instantiateViewController(withIdentifier: storyboardIdentifier) as? HomeViewController
            else { fatalError("Couldn't instantiate \(storyboardIdentifier) from Home") }
        return vc;
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellsCount <~ viewModel.modelCount
        
//        viewModel.needLoginSignal.observe(Observer(value: { needLogin in
//            if needLogin {
//                self.login()
//            }
//        }), during: self.reactive.lifetime)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func login() -> Void {
        let loginVC =  LoginVC.create()
        self.navigationController?.present(loginVC, animated: true, completion: nil)
        
        loginVC.isComplete.signal
            .filter{$0}
            .observeValues{[weak loginVC] _ in
                loginVC?.dismiss(animated: true, completion: nil)
            }
    
    }
}
