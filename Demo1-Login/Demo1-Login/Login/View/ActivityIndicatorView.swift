//
//  O2OActivityIndicatorView.swift
//  shopAssistant
//
//  Created by 周文杰 on 16/10/14.
//  Copyright © 2016年 com.weitaming. All rights reserved.
//

import UIKit

@IBDesignable class ActivityIndicatorView: UIView {
    
    @IBInspectable let bgView = UIImageView(image: UIImage(named:"loading-bg"))
    @IBInspectable let fgView  = UIImageView(image: UIImage(named:"loading-fg"))
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
        self.center = CGPoint(x: frame.midX, y: frame.midY)
        self.backgroundColor = UIColor.white
        bgView.frame = self.bounds
        self.addSubview(bgView)
        
        fgView.frame = self.bounds
        self.addSubview(fgView)
    }
    
    func frame(_ frame:CGRect){
        self.center = CGPoint(x: frame.midX, y: frame.midY)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimating() -> Void {
        fgView.layer.removeAnimation(forKey: "loading_rotation")
        fgView.layer.add(self.animation(), forKey:"loading_rotation")
    }
    
    func stopAnimating() -> Void {
        fgView.layer.removeAnimation(forKey: "loading_rotation")
    }
    
    func isAnimating() -> Bool {
        let ret = fgView.layer.animation(forKey: "loading_rotation") != nil
        return ret
    }

    func animation() -> CAAnimation {
        let animation = CABasicAnimation(keyPath:"transform.rotation.z")
        animation.duration = 1.0
        animation.repeatCount = MAXFLOAT
        animation.fromValue = 0
        animation.toValue = M_PI*2
        
        return animation
    }

}
