//
//  Transform_Rotation2.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/21.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class Transform_Rotation2: UIViewController {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var innerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        addDismissButton()
        
        var outer = CATransform3DIdentity
        outer.m34 = -1.0 / 500.0
        outer = CATransform3DRotate(outer, CGFloat(Double.pi / 4), 0, 1, 0)
        outerView.layer.transform = outer
        
        var inner = CATransform3DIdentity
        inner.m34 = -1.0 / 500.0
        inner = CATransform3DRotate(inner, -CGFloat(Double.pi / 4), 0, 1, 0)
        innerView.layer.transform = inner
    }

}
