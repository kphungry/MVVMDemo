//
//  User.swift
//  MVVMDemo
//
//  Created by 周文杰 on 2017/1/22.
//  Copyright © 2017年 zwj. All rights reserved.
//

import UIKit
import ReactiveSwift
import Moya
import SwiftyJSON
import ReactiveMoya

class User: BaseModel {

    var userName = MutableProperty("")
    func userNameValue(_ newValue: String) -> Void {
        userName.value = newValue
    }
    
    var password: String = ""
    var isLoggedin = MutableProperty(false)
    func isLoggedinValue(_ newValue: Bool) -> Void {
        isLoggedin.value = newValue
    }
    
    static let get = User()
    
    fileprivate override init() {
        super.init()
    }
    
    static func isLogin() -> Bool {
        return User.get.isLoggedin.value
    }
    
    static func logout() -> Void {
        User.get.isLoggedin.value = false
    }

    
    func login() -> SignalProducer<Any, VTMError> {
        
        let target = LoginTargetType(model:self)

        let provider = ReactiveSwiftMoyaProvider<LoginTargetType>(endpointClosure:MoyaProvider.defaultEndpointMapping ,stubClosure: MoyaProvider.delayedStub(3))
        
        let signal = provider.request( target )
        _ = signal.start({ _ in
            
        })
        
        let newSignalProducer = signal.flatMap(FlattenStrategy.latest, transform: {(res :Response) -> SignalProducer<Any, MoyaError> in
            var sign:SignalProducer<Any, MoyaError>
            if( res.statusCode != 200){
                sign = SignalProducer<Any, MoyaError>(error:MoyaError.statusCode(res))
            }else{
                let json = JSON(res.data)
                self.loginWithJson(json)
                sign = SignalProducer<Any, MoyaError>(value:true)
            }
            return sign
        }).mapError({ (err) -> VTMError in
            var errMsg = "服务器繁忙"
            switch err{
            case .jsonMapping(let resp),.statusCode(let resp):
                let json = JSON(resp.data)
                if let msg = json["errmsg"].string {
                    errMsg = msg
                }
            case .underlying(_):
                errMsg = "网络异常"
            default:
                break
            }
            return VTMError(errorMessage: errMsg, errorCode:.UnknownError)
        })
        return newSignalProducer
    }
    
    func loginWithJson(_ json:JSON) -> Void {
        self.userNameValue(json["u"].string!)
        self.isLoggedinValue(true)
    }
}
