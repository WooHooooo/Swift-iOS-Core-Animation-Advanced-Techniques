//
//  Special_CAEmitterLayeer.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/23.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class Special_CAEmitterLayeer: UIViewController {
    fileprivate lazy var simpleView:UIView = {
        [weak self] in
        var aView = UIView(frame:(self?.view.bounds)!)
        aView.isUserInteractionEnabled = false
        aView.isMultipleTouchEnabled = false
        return aView
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        let emitter = CAEmitterLayer()
        emitter.frame = simpleView.bounds
        simpleView.layer.addSublayer(emitter)
        
        emitter.renderMode = kCAEmitterLayerAdditive
        emitter.emitterPosition = CGPoint(x:emitter.frame.size.width / 2.0,y:emitter.frame.size.height / 2.0)
        
        let cell = CAEmitterCell()
        cell.contents = UIImage(named: "Spark")?.cgImage
        cell.birthRate = 150
        cell.lifetime = 5.0
        cell.color = UIColor.init(red: 1, green: 0.5, blue: 0.1, alpha: 1.0).cgColor
        cell.alphaSpeed = -0.4
        cell.velocity = 50
        cell.velocityRange = 50
        cell.emissionRange = CGFloat(Double.pi * 2.0)
        
        emitter.emitterCells = [cell]
        
        view.addSubview(simpleView)
    }

}
