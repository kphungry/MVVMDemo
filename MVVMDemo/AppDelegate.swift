//
//  AppDelegate.swift
//  MVVMDemo
//
//  Created by 周文杰 on 2017/1/22.
//  Copyright © 2017年 zwj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewModel = AppdelegateViewModel()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        viewModel.didFinishLaunchingWithOptions()
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.rootVC()
        //        self.window?.tintColor = Const.WTM_SILVER
        self.window?.makeKeyAndVisible()

        
        return true
    }

    func rootVC() -> UIViewController {
        let rootVC = HomeViewController.create()
        return UINavigationController(rootViewController: rootVC)
    }

}

