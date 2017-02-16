//
//  LoginVM.swift
//  shopAssistant
//
//  Created by 周文杰 on 2017/1/13.
//  Copyright © 2017年 com.weitaming. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result
import Moya
import SwiftyJSON

class LoginVM: NSObject {
    
    var model:User{
        didSet{
            self.model.userName <~ self.userNameProperty
        }
    }
    
    private var userNameProperty = MutableProperty("")
    func setUserName(_ value:String){
        userNameProperty.value = value
    }
    
    private var passwordProperty = MutableProperty("")
    func setPassword(_ value:String){
        passwordProperty.value = value
    }
    
    var loadingSignal = Signal<Bool,NoError>.pipe()
    
    var isLogin = MutableProperty(false)
    func setLogin(_ value:Bool){
        isLogin.value = value
    }
    
//    var actionLogin:Action<Any, Any, VTMError>!

    override init() {
        model = User.get
        super.init()
//        actionLogin = Action(){ (_) -> SignalProducer<Any, VTMError>  in
//                self.loadingSignal.input.send(value: true) //开始loading
//            let result = self.model.login()
//            
//            result.observe(Observer<Any, VTMError>{ event in
//                self.loadingSignal.input.send(value: false) //结束 loading
//            }, during: self.reactive.lifetime)
//            
//            return result
//        }
        
        isLogin <~ model.isLoggedin
    }
    
    func doLoginCommand() -> SignalProducer<Any, TextError>{
        self.loadingSignal.input.send(value: true) //开始loading
        let result = self.model.login()
        
        result.observe(Observer<Any, TextError>{ event in
            self.loadingSignal.input.send(value: false) //结束 loading
        }, during: self.reactive.lifetime)
        
        return result
    }
}

extension LoginVM{
    var input:LoginVM{
        return self
    }
    
    var output:LoginVM{
        return self
    }

}
