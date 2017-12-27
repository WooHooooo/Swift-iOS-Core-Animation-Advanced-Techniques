//
//  Duration_RepeatCount.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/25.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class Duration_RepeatCount: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var durationField: UITextField!
    @IBOutlet weak var repeatField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    let shipLayer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        durationField.delegate = self
        repeatField.delegate = self
        
        shipLayer.frame = CGRect(x:0,y:0,width:128,height:128)
        shipLayer.position = CGPoint(x:containerView.bounds.width/2,y:containerView.bounds.height/2)
        shipLayer.contents = UIImage(named:"Ship")?.cgImage
        containerView.layer.addSublayer(shipLayer)
        
    }
    
    func setControlsEnabled(enabled: Bool){
        for control in [durationField,repeatField,startButton] as [Any] {
            (control as! UIControl).isEnabled = enabled
            (control as! UIControl).alpha = enabled ? 1.0: 0.25
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func start(_ sender:UIButton){
        
        guard let durationText = durationField.text, let duration = Double(durationText) else {
            return
        }
        
        guard let repeatText = repeatField.text, let repeatCount = Float(repeatText) else {
            return
        }
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation"
        animation.duration = duration
        animation.repeatCount = repeatCount
        animation.byValue = CGFloat(Double.pi * 2)
        animation.delegate = self
        shipLayer.add(animation, forKey: "rotateAnimation")
        setControlsEnabled(enabled: false)
    }
    
    
}

extension Duration_RepeatCount:CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        setControlsEnabled(enabled: true)
    }
}
