//
//  CoordinateSystem.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/20.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit
class CoordinateSystem:UIViewController {
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var greenView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        greenView.layer.zPosition = 1.0
    }
}
