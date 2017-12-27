//
//  ReboundBall_KeyTimes.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/25.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class ReboundBall_KeyTimes: UIViewController {
    @IBOutlet weak var containerView: UIView!
    var ballView:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        let ballImage = UIImage(named: "Ball")
        ballView = UIImageView.init(image: ballImage)
        containerView.addSubview(ballView)
        animate()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animate()
    }
    
    func animate(){
        ballView.center = CGPoint(x:150,y:32)
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.duration = 1.0
        animation.values = [NSValue.init(cgPoint: CGPoint(x:150,y:32)),NSValue.init(cgPoint: CGPoint(x:150,y:268)),
                            NSValue.init(cgPoint: CGPoint(x:150,y:140)),NSValue.init(cgPoint: CGPoint(x:150,y:268)),
                            NSValue.init(cgPoint: CGPoint(x:150,y:220)),NSValue.init(cgPoint: CGPoint(x:150,y:268)),
                            NSValue.init(cgPoint: CGPoint(x:150,y:250)),NSValue.init(cgPoint: CGPoint(x:150,y:268))]
        animation.timingFunctions = [
            CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn),CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut),
            CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn),CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut),
            CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn),CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut),
            CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn),CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        ]
        
        animation.keyTimes = [0.0,0.3,0.5,0.7,0.8,0.9,0.95,1.0]
        ballView.layer.position = CGPoint(x:150,y:268)
        ballView.layer.add(animation, forKey: nil)
    }
}
