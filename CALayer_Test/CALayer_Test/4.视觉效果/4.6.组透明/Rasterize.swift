//
//  Rasterize.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/21.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class Rasterize: UIViewController {

    lazy var customButton1:UIButton = { [weak self] in
        let button = UIButton(frame:CGRect(x:0,y:0,width:150,height:50))
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        
        let label = UILabel(frame:CGRect(x:20,y:10,width:110,height:30))
        label.text = "Hello World"
        label.textAlignment = NSTextAlignment.center
        button.addSubview(label)
        button.center = CGPoint(x:(self?.view.bounds.width)!/2,y:150)
        return button
    }()
    
    lazy var customButton2:UIButton = { [weak self] in
        let button = UIButton(frame:CGRect(x:0,y:0,width:150,height:50))
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        
        let label = UILabel(frame:CGRect(x:20,y:10,width:110,height:30))
        label.text = "Hello World"
        label.textAlignment = NSTextAlignment.center
        button.addSubview(label)
        button.center = CGPoint(x:(self?.view.bounds.width)!/2,y:300)
        button.alpha = 0.5
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        view.addSubview(customButton1)
        view.addSubview(customButton2)
        
    }

}
