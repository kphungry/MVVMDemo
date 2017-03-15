//
//  LoginTargetType.swift
//  shopAssistant
//
//  Created by 周文杰 on 2017/1/18.
//  Copyright © 2017年 com.weitaming. All rights reserved.
//

import UIKit
import Moya

class LoginTargetType: BaseTargetType {

    var  model : User
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    override var path: String { get{
            return "/sign_in?";
        } }

    
    /// The parameters to be incoded in the request.
    override var parameters: [String: Any]? { get{
        return [
            "u": model.userName,
            "s": model.password]
        }}
    
    /// Provides stub data for use in testing.
    override var sampleData: Data { get{
        return "{\"u\":\"test\"}".data(using: .utf8)!
        }}
    
    override init() {
        model = User.get
        super.init()
    }
    
    init(model newModel:User ) {
        model = newModel
        super.init()
    }
}
