//
//  LayerBorder.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/21.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class LayerBorder: UIViewController {
    @IBOutlet weak var layerView1:UIView!
    @IBOutlet weak var layerView2:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        layerView1.layer.cornerRadius = 20.0
        layerView2.layer.cornerRadius = 20.0
        
        layerView1.layer.borderWidth = 5.0
        layerView2.layer.borderWidth = 5.0
        
        layerView2.layer.masksToBounds = true
    }
}
