//
//  HomeViewModel.swift
//  MVVMDemo
//
//  Created by 周文杰 on 2017/2/9.
//  Copyright © 2017年 zwj. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

class HomeViewModel: NSObject {

    var model = HomeModel()
    
    var needLoginSignal = MutableProperty(false)
    
    internal var viewWillAppearSignal = MutableProperty(false)
    func viewWillAppear() {
        viewWillAppearSignal.value = true
        _ = model.refresh().startWithFailed({ err in
            switch err {
            case .ORMBizNeedLogin:
                self.needLoginSignal.value = true
            default:
                break
            }
        })
        
    }
    
    internal var viewWillDisappearSignal = MutableProperty(false)
    func viewWillDisappear() {
        viewWillDisappearSignal.value = true
    }

    var modelCount = MutableProperty(0)
    func initViewModel(){
        
        modelCount <~ model.list.map{$0.count}
        
    }
    
}

