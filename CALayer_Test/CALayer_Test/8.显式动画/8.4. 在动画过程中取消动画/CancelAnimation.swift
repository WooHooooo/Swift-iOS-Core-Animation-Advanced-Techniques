//
//  CancelAnimation.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/25.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class CancelAnimation: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    let shipLayer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        shipLayer.frame = CGRect(x:0,y:0,width:128,height:128)
        shipLayer.position = CGPoint(x:containerView.bounds.width/2,y:containerView.bounds.height/2)
        shipLayer.contents = UIImage(named:"Ship")?.cgImage
        containerView.layer.addSublayer(shipLayer)
        
    }
    
    @IBAction func start(_ sender:UIButton){
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation"
        animation.duration = 2.0
        animation.byValue = CGFloat(Double.pi)
        animation.delegate = self
        shipLayer.add(animation, forKey: "rotateAnimation")
    }
    
    @IBAction func stop(_ sender:UIButton){
        shipLayer.removeAnimation(forKey: "rotateAnimation")
    }
    
}

extension CancelAnimation:CAAnimationDelegate{
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("动画结束")
    }
}

