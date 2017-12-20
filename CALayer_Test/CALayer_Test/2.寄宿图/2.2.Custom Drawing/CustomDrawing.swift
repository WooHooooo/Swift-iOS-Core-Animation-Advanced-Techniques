//
//  CustomDrawing.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/20.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit

class CustomDrawing:UIViewController {
    
    fileprivate lazy var simpleView:UIView = {
        [weak self] in
        var aView = UIView(frame:CGRect(x:(self?.view.bounds.width)!*2.5/8,y:(self?.view.bounds.height)!/5,width:(self?.view.bounds.width)!*3/8,height:(self?.view.bounds.height)!*1.3/5))
        aView.backgroundColor = UIColor.white
        return aView
        }()
    fileprivate lazy var blueLayer:CALayer = {
        [weak self] in
        let aLayer = CALayer()
        aLayer.frame = CGRect(x: (self?.view.bounds.width)!/8,y: (self?.view.bounds.height)!*0.3/5, width: (self?.view.bounds.width)!/8,height: (self?.view.bounds.height)!*0.7/5)
        aLayer.backgroundColor = UIColor.blue.cgColor
        aLayer.delegate = self
        aLayer.contentsScale = UIScreen.main.scale
        return aLayer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        //blueLayer.delegate = self as! CALayerDelegate
        simpleView.layer.addSublayer(blueLayer)
        view.addSubview(simpleView)
        blueLayer.display()
    }
}

extension CustomDrawing:CALayerDelegate{
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setLineWidth(10.0)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
}
