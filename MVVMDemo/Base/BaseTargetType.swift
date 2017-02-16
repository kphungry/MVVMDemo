//
//  BaseModel.swift
//  MVVMDemo
//
//  Created by 周文杰 on 2017/1/22.
//  Copyright © 2017年 zwj. All rights reserved.
//

import UIKit
import Moya

class BaseTargetType: NSObject,TargetType {

    
    
    //MARK :- TargetType
    /// The target's base `URL`.
    var baseURL: URL { get{
        return URL(string:"https://api.zhihu.com")!
        }
    }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get{
        return ""
        } }
    
    /// The HTTP method used in the request.
    var method: Moya.Method { get{
        return .post
        }}
    
    /// The parameters to be incoded in the request.
    var parameters: [String: Any]? { get{
        return [:]
        }}
    
    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding { get{
        return URLEncoding.default
        }}
    
    /// Provides stub data for use in testing.
    var sampleData: Data { get{
        return "".data(using: .utf8)!
        }}
    
    /// The type of HTTP task to be performed.
    var task: Task { get {
        return .request
        }}
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool { get{
        return false
        }}
    
    override init() {

    }

}
