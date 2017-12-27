//
//  PresentationLayer.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/24.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class PresentationLayer: UIViewController {
    var colorLayer:CALayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        colorLayer = CALayer()
        colorLayer.frame = CGRect(x:0,y:0,width:100,height:100)
        colorLayer.position = CGPoint(x:view.bounds.width/2,y:view.bounds.height/2)
        colorLayer.backgroundColor = UIColor.red.cgColor
        view.layer.addSublayer(colorLayer)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: view) else {
            return
        }
        if ((colorLayer.presentation()?.hitTest(point)) != nil) {
            let red = CGFloat(arc4random_uniform(255))/255
            let green = CGFloat(arc4random_uniform(255))/255
            let blue = CGFloat(arc4random_uniform(255))/255
            colorLayer.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0).cgColor
        } else {
            CATransaction.begin()
            CATransaction.setAnimationDuration(1.0)
            //10.1 动画速度-CAMediaTimingFunction(全速后减速)
            CATransaction.setAnimationTimingFunction(CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut))
            colorLayer.position = point
            CATransaction.commit()
        }
    }

}
