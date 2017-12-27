//
//  ReboundBall_Auto.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/25.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class ReboundBall_Auto: UIViewController {
    @IBOutlet weak var containerView: UIView!
    var ballView:UIImageView!
    
    func bounceEaseOut(_ t:Float)->Float{
        if (t < 4/11.0) {
            return (121 * t * t)/16.0
        } else if (t < 8/11.0) {
            return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0
        } else if (t < 9/10.0) {
            return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0
        }
        return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0
    }
    
    func interpolate(from:Float,to:Float,time:Float)->CGFloat{
        return CGFloat((to-from) * time + from)
    }
    
    func interpolateFromValue(fromValue:CGPoint,toValue:CGPoint,time:Float)->NSValue{
        let result = CGPoint(x:interpolate(from: Float(fromValue.x), to: Float(toValue.x), time: time),y:interpolate(from: Float(fromValue.y), to: Float(toValue.y), time: time))
        return NSValue.init(cgPoint: result)
    }
    
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
    
        let fromValue = CGPoint(x:150,y:32)
        let toValue = CGPoint(x:150,y:268)
        let duration:CFTimeInterval = 1.0
        let numFrames:NSInteger = NSInteger(duration * 60)
        var frames:[NSValue] = []
        for path in 1..<numFrames {
            let time = bounceEaseOut(1/60.0 * Float(path))
            frames.append(interpolateFromValue(fromValue: fromValue, toValue: toValue, time: time))
        }
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.duration = 1.0
        animation.values = frames
        
        ballView.layer.position = CGPoint(x:150,y:268)
        ballView.layer.add(animation, forKey: nil)
    }

}
