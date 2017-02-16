//
//  AppdelegateViewModel.swift
//  MVVMDemo
//
//  Created by 周文杰 on 2017/2/9.
//  Copyright © 2017年 zwj. All rights reserved.
//

import UIKit
import ReactiveSwift

class AppdelegateViewModel: NSObject {

    var didFinishLaunchingWithOptionsSignal = MutableProperty(false)
    func didFinishLaunchingWithOptions() {
        didFinishLaunchingWithOptionsSignal.value = true
    }
    
    override init() {
        super.init()
        self.initViewModel()
    }
    
    func initViewModel() -> Void {
        
    }
}
