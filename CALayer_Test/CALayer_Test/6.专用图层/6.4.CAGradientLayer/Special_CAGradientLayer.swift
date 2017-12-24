//
//  Special_CAGradientLayer.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/22.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit


class Special_CAGradientLayer:UIViewController {
    fileprivate lazy var simpleView:UIView = {
        [weak self] in
        var aView = UIView(frame:CGRect(x:(self?.view.bounds.width)!/8,y:(self?.view.bounds.height)!/5,width:(self?.view.bounds.width)!*6/8,height:(self?.view.bounds.height)!*3/5))
        return aView
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = simpleView.bounds
        simpleView.layer.addSublayer(gradientLayer)
        
        gradientLayer.colors = [UIColor.red.cgColor,UIColor.yellow.cgColor,UIColor.green.cgColor]
        gradientLayer.locations = [0.0,0.25,0.5]
        
        gradientLayer.startPoint = CGPoint(x:0,y:0)
        gradientLayer.endPoint = CGPoint(x:1,y:1)
        
        view.addSubview(simpleView)
    }
}
