//
//  PropertyAnimations_CGPath.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/24.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class PropertyAnimations_CGPath: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    let shipLayer = CALayer()
    let bezierPath = UIBezierPath()
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        let width = containerView.bounds.width
        let height = containerView.bounds.height
        bezierPath.move(to: CGPoint(x:30,y:150))
        bezierPath.addCurve(to: CGPoint(x:width-30,y:150), controlPoint1: CGPoint(x:(width-100)/3+50,y:0), controlPoint2: CGPoint(x:(width-100)/3*2+50, y: height))
        let pathLayer = CAShapeLayer()
        pathLayer.path = bezierPath.cgPath
        pathLayer.fillColor = UIColor.clear.cgColor
        pathLayer.strokeColor = UIColor.red.cgColor
        pathLayer.lineWidth = 3.0
        containerView.layer.addSublayer(pathLayer)
        
        
        shipLayer.frame = CGRect(x:0,y:0,width:64,height:64)
        shipLayer.position = CGPoint(x:30,y:150)
        shipLayer.contents = UIImage(named:"Ship")?.cgImage
        containerView.layer.addSublayer(shipLayer)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.duration = 4.0
        animation.path = bezierPath.cgPath
        animation.rotationMode = kCAAnimationRotateAuto
        animation.repeatCount = MAXFLOAT
        shipLayer.add(animation, forKey: nil)
    }
    
}
