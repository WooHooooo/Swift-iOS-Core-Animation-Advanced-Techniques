//
//  PropertyAnimations_KeyFrames.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/24.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class PropertyAnimations_KeyFrames: UIViewController {

    @IBOutlet weak var layerView: UIView!
    var colorLayer:CALayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        addDismissButton()
        colorLayer = CALayer()
        colorLayer.frame = CGRect(x:50.0,y:50.0,width:100.0,height:100.0)
        colorLayer.backgroundColor = UIColor.blue.cgColor
        layerView.layer.addSublayer(colorLayer)
    }
    
    @IBAction func changeColor(_ sender: Any) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "backgroundColor"
        animation.duration = 2.0
        animation.values = [UIColor.blue.cgColor,UIColor.red.cgColor,UIColor.green.cgColor,UIColor.blue.cgColor]
        let fn = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        animation.timingFunctions = [fn,fn,fn]
        colorLayer.add(animation, forKey: nil)
    }
}

