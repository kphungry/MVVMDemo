//
//  LoadingView.swift
//  shopAssistant
//
//  Created by 周文杰 on 2017/1/19.
//  Copyright © 2017年 com.weitaming. All rights reserved.
//

import UIKit
import ReactiveSwift

@IBDesignable class LoadingView: UIView {

    @IBInspectable var loading = ActivityIndicatorView.init(frame:CGRect.zero)
    
    override init(frame:CGRect){
        super.init(frame: frame)
        initViews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initViews();
    }

    func initViews(){
        loading.frame(self.bounds)
        self.backgroundColor = UIColor.white
        self.addSubview(loading)
    }
    
    func showLoading(_ shown : Bool){
        self.isHidden = !shown
        if shown {
            loading.startAnimating()
        }else{
            loading.stopAnimating()
        }
    }

    override func layoutSubviews() {
        loading.frame(self.bounds)

        super.layoutSubviews()
    }
}
