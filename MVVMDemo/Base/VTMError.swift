//
//  VTMError.swift
//  shopAssistant
//
//  Created by 周文杰 on 2017/1/19.
//  Copyright © 2017年 com.weitaming. All rights reserved.
//

import UIKit

public enum VTMError: Swift.Error {

    case ORMNoRepresentor
    case ORMNotSuccessfulHTTP
    case ORMNoData
    case ORMCouldNotMakeObjectError
    /**
     *  业务错误
     */
    case ORMBizError(resultCode: Int?, resultMsg: String?)
    
    case ORMBizNeedLogin
}

public struct TextError: Swift.Error{
    var errorMessage:String?
}
