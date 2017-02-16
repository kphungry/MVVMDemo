//
//  ReactiveTableview.swift
//  MVVMDemo
//
//  Created by 周文杰 on 2017/2/10.
//  Copyright © 2017年 zwj. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import ReactiveCocoa

open class DataSource :NSObject, UITableViewDataSource{
    
    var cellViewModels: [CellViewModel] = []
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return NewsTableViewCell()
    }
    
    
//    public func numberOfSections(in tableView: UITableView) -> Int {
//        
//    }
//    
//    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//    }
//    
//    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        
//    }
    
}
