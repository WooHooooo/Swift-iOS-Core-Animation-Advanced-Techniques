//
//  ConrnerRadius.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/20.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit

class ConrnerRadius: UIViewController {
    @IBOutlet weak var layerView1:UIView!
    @IBOutlet weak var layerView2:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        layerView1.layer.cornerRadius = 20.0
        layerView2.layer.cornerRadius = 20.0
        
        layerView2.layer.masksToBounds = true
    }
}
