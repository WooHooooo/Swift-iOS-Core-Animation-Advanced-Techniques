//
//  Special_CAShapeLayer.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/22.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit

class Special_CAShapeLayer:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x:175,y:100))
        
        path.addArc(withCenter: CGPoint(x:150,y:100), radius: 25, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: true)
        path.move(to: CGPoint(x:150,y:125))
        path.addLine(to: CGPoint(x:150,y:175))
        path.addLine(to: CGPoint(x:125,y:225))
        path.move(to: CGPoint(x:150,y:175))
        path.addLine(to: CGPoint(x:175,y:225))
        path.move(to: CGPoint(x:100,y:150))
        path.addLine(to: CGPoint(x:200,y:150))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.path = path.cgPath
        
        view.layer.addSublayer(shapeLayer)
    }
}
