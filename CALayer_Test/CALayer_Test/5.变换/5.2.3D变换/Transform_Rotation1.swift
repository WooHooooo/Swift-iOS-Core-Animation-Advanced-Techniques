//
//  Transform_Rotation1.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/21.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class Transform_Rotation1: UIViewController {
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var innerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDismissButton()
        let outer = CATransform3DRotate(CATransform3DIdentity, CGFloat(Double.pi/4), 0, 0, 1)
        outerView.layer.transform = outer
        let inner = CATransform3DRotate(CATransform3DIdentity, -CGFloat(Double.pi/4), 0, 0, 1)
        innerView.layer.transform = inner
    }

}
