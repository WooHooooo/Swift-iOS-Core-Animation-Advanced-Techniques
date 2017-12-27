//
//  RepeatDuration.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/25.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class RepeatDuration: UIViewController {
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
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.y"
        animation.toValue = -Double.pi/2
        animation.duration = 2.0
        animation.repeatDuration = .infinity
        animation.autoreverses = true
        doorLayer.add(animation, forKey: nil)
    }
}
