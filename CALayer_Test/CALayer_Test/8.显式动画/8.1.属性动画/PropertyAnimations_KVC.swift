//
//  PropertyAnimations_KVC.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/24.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class PropertyAnimations_KVC: UIViewController {

    @IBOutlet weak var hourHand: UIImageView!
    @IBOutlet weak var minuteHand: UIImageView!
    @IBOutlet weak var secondHand: UIImageView!
    weak var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        secondHand.layer.anchorPoint = CGPoint(x:0.5,y:0.9)
        minuteHand.layer.anchorPoint = CGPoint(x:0.5,y:0.9)
        hourHand.layer.anchorPoint = CGPoint(x:0.5,y:0.9)
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        updateHandsAnimated(animated: false)
    }
    
    @objc func tick(){
        updateHandsAnimated(animated: true)
    }
    
    func updateHandsAnimated(animated: Bool) {
        let calendar = Calendar(identifier:.gregorian)
        let units = Set<Calendar.Component>([.hour,.minute,.second])
        let components = calendar.dateComponents(units, from: Date())
        
        let hourAngle = CGFloat((Double(components.hour ?? 0) / 12.0) * Double.pi * 2.0)
        let minsAngle = CGFloat((Double(components.minute ?? 0) / 60.0) * Double.pi * 2.0)
        let secsAngle = CGFloat((Double(components.second ?? 0) / 60.0) * Double.pi * 2.0)
        
        setAngle(angle: hourAngle, handView: hourHand, animated: animated)
        setAngle(angle: minsAngle, handView: minuteHand, animated: animated)
        setAngle(angle: secsAngle, handView: secondHand, animated: animated)
    }
    
    func setAngle(angle:CGFloat,handView:UIView,animated:Bool){
        let transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        if animated {
            let animation = CABasicAnimation()
            animation.keyPath = "transform"
            animation.fromValue = handView.layer.presentation()?.value(forKey: "transform")
            animation.toValue = NSValue.init(caTransform3D: transform)
            animation.duration = 0.5
            animation.delegate = self
            animation.timingFunction = CAMediaTimingFunction.init(controlPoints: 1, 0, 0.75, 1)
            handView.layer.transform = transform
            handView.layer.add(animation, forKey: nil)
        }else{
            handView.layer.transform = transform
        }
    }
}

extension PropertyAnimations_KVC:CAAnimationDelegate{
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//        let handView = anim.value(forKey: "handView") as! UIView
//        handView.layer.transform = (anim as! CABasicAnimation).toValue as! CATransform3D
    }
}
