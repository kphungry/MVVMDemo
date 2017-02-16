//
//  News.swift
//  MVVMDemo
//
//  Created by 周文杰 on 2017/2/10.
//  Copyright © 2017年 zwj. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

struct News {
    var newsId:String
    var title:String
    var imgUrl:String

}

class HomeModel: NSObject {
    
    var list = MutableProperty([])
    func setNews(_ another:[News]){
        list.value = another
    }
    func appendNews(_ toAppend:[News]){
        list.value = list.value + toAppend
    }
    
    
    func refresh() -> SignalProducer<Any, VTMError> {
        //刷新需要登录
        if !User.get.isLoggedin.value {
            return SignalProducer.init(error: VTMError.ORMBizNeedLogin)
        }
        
        return SignalProducer.empty
    }
}
