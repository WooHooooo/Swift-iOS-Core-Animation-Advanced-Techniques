//
//  Shadow.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/21.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class Shadow: UIViewController {
    @IBOutlet weak var layerView1:UIView!
    @IBOutlet weak var layerView2:UIView!
    @IBOutlet weak var shadowView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        layerView1.layer.cornerRadius = 20.0
        layerView2.layer.cornerRadius = 20.0
        
        layerView1.layer.borderWidth = 5.0
        layerView2.layer.borderWidth = 5.0
        
        layerView1.layer.shadowOpacity = 0.5
        layerView1.layer.shadowOffset = CGSize(width:0.0,height:5.0)
        layerView1.layer.shadowRadius = 5.0
        
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowOffset = CGSize(width:0.0,height:5.0)
        shadowView.layer.shadowRadius = 5.0
        
        layerView2.layer.masksToBounds = true
    }

   
}
