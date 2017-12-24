//
//  Special_CAReplicatorLayer.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/22.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit

class Special_CAReplicatorLayer:UIViewController {
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        let replocator = CAReplicatorLayer()
        replocator.frame = containerView.bounds
        containerView.layer.addSublayer(replocator)
        
        replocator.instanceCount = 10
        
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, 0, 200, 0)
        transform = CATransform3DRotate(transform, CGFloat(Double.pi/5.0), 0, 0, 1)
        transform = CATransform3DTranslate(transform, 0, -200, 0)
        replocator.instanceTransform = transform
        
        replocator.instanceBlueOffset = -0.1
        replocator.instanceGreenOffset = -0.1
        
        let layer = CALayer()
        layer.frame = CGRect(x:100.0,y:100.0,width:100.0,height:100.0)
        layer.backgroundColor = UIColor.white.cgColor
        replocator.addSublayer(layer)
    }
}
