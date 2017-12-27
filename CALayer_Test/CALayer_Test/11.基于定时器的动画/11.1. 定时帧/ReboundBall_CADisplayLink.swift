//
//  ReboundBall_CADisplayLink.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/26.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class ReboundBall_CADisplayLink: UIViewController {
    @IBOutlet weak var containerView: UIView!
    var ballView:UIImageView!
    var timer:CADisplayLink!
    var duration:TimeInterval!
    var timeOffset:TimeInterval!
    var lastStep:TimeInterval!
    var fromValue:CGPoint!
    var toValue:CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        let ballImage = UIImage(named:"Ball")
        ballView = UIImageView.init(image: ballImage)
        containerView.addSubview(ballView)
        animate()
    }
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animate()
    }
    
    func animate(){
        
        ballView.center = CGPoint(x:150,y:32)
        duration = 1.0
        timeOffset = 0.0
        fromValue = CGPoint(x:150,y:32)
        toValue = CGPoint(x:150,y:268)
        //timer.invalidate()
        lastStep = CACurrentMediaTime()
        timer = CADisplayLink.init(target: self, selector: #selector(step(_:)))
        timer.add(to: RunLoop.main, forMode: .defaultRunLoopMode)
    }
    
    @objc func step(_ step: CADisplayLink){
        
        let thisStep = CACurrentMediaTime()
        let stepDuration = thisStep - lastStep
        lastStep = thisStep
        
        timeOffset = min(timeOffset + stepDuration, duration)
        let time = bounceEaseOut(Float(timeOffset / duration))
        let position = interpolateFromValue(fromValue: fromValue, toValue: toValue, time: time)
        ballView.center = position.cgPointValue
        if timeOffset >= duration {
            timer.invalidate()
            timer = nil
        }
    }

}
