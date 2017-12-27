//
//  ManuallyAnimation.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/25.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class ManuallyAnimation: UIViewController {

    @IBOutlet weak var containerView: UIView!
    let doorLayer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        doorLayer.frame = CGRect(x:0,y:0,width:128,height:256)
        doorLayer.position = CGPoint(x:containerView.bounds.width/2 - 64,y:containerView.bounds.height/2)
        doorLayer.anchorPoint = CGPoint(x:0,y:0.5)
        doorLayer.contents = UIImage(named:"Door")?.cgImage
        containerView.layer.addSublayer(doorLayer)
        
        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0/500.0
        containerView.layer.sublayerTransform = perspective
        
        doorLayer.speed = 0.0
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.y"
        animation.toValue = Double.pi/2
        animation.duration = 1.0
        doorLayer.add(animation, forKey: nil)
        
        let pan = UIPanGestureRecognizer()
        pan.addTarget(self, action: #selector(pan(_:)))
        pan.maximumNumberOfTouches = 1
        view.addGestureRecognizer(pan)
        
    }
    
    @objc func pan(_ sender: UIPanGestureRecognizer){
        var x = sender.translation(in: view).x
        x /= 200.0
        var timeOffset = doorLayer.timeOffset
        timeOffset = min(0.999, max(0.0,timeOffset - Double(x)))
        doorLayer.timeOffset = timeOffset
        sender.setTranslation(CGPoint.zero, in: view)
    }
}
