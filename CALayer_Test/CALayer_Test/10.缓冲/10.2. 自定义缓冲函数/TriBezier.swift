//
//  TriBezier.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/25.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class TriBezier: UIViewController {
    @IBOutlet weak var layerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        //各种方法缓存曲线
        //let function = CAMediaTimingFunction(name:kCAMediaTimingFunctionLinear)
        //let function = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
        //let function = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseOut)
        //let function = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        //let function = CAMediaTimingFunction(name:kCAMediaTimingFunctionDefault)
        let function = CAMediaTimingFunction.init(controlPoints: 1, 0, 0.75, 1)
        
        //指针初始化方法
        var controlPoint1 = UnsafeMutablePointer<Float>.allocate(capacity: 2)
        var controlPoint2 = UnsafeMutablePointer<Float>.allocate(capacity: 2)
        var pointArray = [CGPoint]()
        function.getControlPoint(at: 1, values: controlPoint1)
        pointArray.append(CGPoint(x:CGFloat(controlPoint1[0]),y:CGFloat(controlPoint1[1])))
        function.getControlPoint(at: 2, values: controlPoint2)
        pointArray.append(CGPoint(x:CGFloat(controlPoint2[0]),y:CGFloat(controlPoint2[1])))
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        path.addCurve(to: CGPoint(x:1,y:1), controlPoint1: pointArray[0], controlPoint2: pointArray[1])
        path.apply(CGAffineTransform.init(scaleX: 200, y: 200))
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 4.0
        shapeLayer.path = path.cgPath
        layerView.layer.addSublayer(shapeLayer)
        layerView.layer.isGeometryFlipped = true
    }

}
