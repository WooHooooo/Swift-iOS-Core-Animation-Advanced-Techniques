//
//  Transform_sublayer.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/21.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class Transform_sublayer: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var layerView1: UIImageView!
    @IBOutlet weak var layerView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDismissButton()
        var perspective = CATransform3DIdentity
        perspective.m34 = -(1.0 / 500.0)
        containerView.layer.sublayerTransform = perspective
        
        let transform1 = CATransform3DRotate(CATransform3DIdentity, CGFloat(Double.pi/4), 0, 1, 0)
        layerView1.layer.transform = transform1
        
        let transform2 = CATransform3DRotate(CATransform3DIdentity, -CGFloat(Double.pi/4), 0, 1, 0)
        layerView2.layer.transform = transform2
    }
}
