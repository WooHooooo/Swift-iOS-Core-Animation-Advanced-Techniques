//
//  AnchorPoint.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/20.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class AnchorPoint: UIViewController {

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
        self.tick()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func tick(){
        let calendar = Calendar(identifier:.gregorian)
        let units = Set<Calendar.Component>([.hour,.minute,.second])
        let components = calendar.dateComponents(units, from: Date())
        
        let hourAngle = (Double(components.hour ?? 0) / 12.0) * Double.pi * 2.0
        let minsAngle = (Double(components.minute ?? 0) / 60.0) * Double.pi * 2.0
        let secsAngle = (Double(components.second ?? 0) / 60.0) * Double.pi * 2.0
        
        self.hourHand.transform = CGAffineTransform(rotationAngle: CGFloat(hourAngle))
        self.minuteHand.transform = CGAffineTransform(rotationAngle: CGFloat(minsAngle))
        self.secondHand.transform = CGAffineTransform(rotationAngle: CGFloat(secsAngle))
    }
}
