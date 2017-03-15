//
//  VTMError.swift
//  shopAssistant
//
//  Created by 周文杰 on 2017/1/19.
//  Copyright © 2017年 com.weitaming. All rights reserved.
//

import UIKit
import Moya

public extension MoyaError {
    
    func mapVTMError() -> VTMError{
        switch self {
        case .imageMapping(_):
            return VTMError(errorMessage: "下载图片失败",errorCode:VTMErrorCode.ServerError)
        case .jsonMapping(_):
            return VTMError(errorMessage: "JSON格式错误",errorCode:VTMErrorCode.ServerError)
        case .stringMapping(_):
            return VTMError(errorMessage: "服务器繁忙，请稍后重试",errorCode:VTMErrorCode.ServerError)
        case .statusCode(_):
            return VTMError(errorMessage: "服务器繁忙，请稍后重试",errorCode:VTMErrorCode.ServerError)
        case .underlying:
            return VTMError(errorMessage: "网络异常，请稍后重试",errorCode:VTMErrorCode.NetworkError)
        case .requestMapping:
            return VTMError(errorMessage: "App错啦，请稍后重试",errorCode:VTMErrorCode.AppError)
        }
    }
    
}

public struct VTMError: Swift.Error{
    var errorMessage:String?
    var errorCode:VTMErrorCode

}

public enum VTMErrorCode{
    case ServerError
    case NetworkError
    case AppError
    case NeedLogin
    case UnknownError
}

