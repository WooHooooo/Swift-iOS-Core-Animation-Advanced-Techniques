//
//  AnimationGroup.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/25.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class AnimationGroup: UIViewController {

    @IBOutlet weak var containerView: UIView!
    let colorLayer = CALayer()
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
        
        
        colorLayer.frame = CGRect(x:0,y:0,width:64,height:64)
        colorLayer.position = CGPoint(x:30,y:150)
        colorLayer.backgroundColor = UIColor.green.cgColor
        containerView.layer.addSublayer(colorLayer)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let animation1 = CAKeyframeAnimation()
        animation1.keyPath = "position"
        animation1.path = bezierPath.cgPath
        animation1.rotationMode = kCAAnimationRotateAuto
        
        let animation2 = CABasicAnimation()
        animation2.keyPath = "backgroundColor"
        animation2.toValue = UIColor.red.cgColor
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [animation1,animation2]
        groupAnimation.duration = 4.0
        
        colorLayer.add(groupAnimation, forKey: nil)
    }
    
    
    
}

