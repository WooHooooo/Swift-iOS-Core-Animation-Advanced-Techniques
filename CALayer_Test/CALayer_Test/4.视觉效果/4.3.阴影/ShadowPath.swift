//
//  ShadowPath.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/21.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class ShadowPath: UIViewController {
    @IBOutlet weak var layerView1:UIView!
    @IBOutlet weak var layerView2:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        layerView1.layer.shadowOpacity = 0.5
        layerView2.layer.shadowOpacity = 0.5
        
        let squarePath = CGMutablePath()
        squarePath.addRect(layerView1.bounds)
        layerView1.layer.shadowPath = squarePath
        
        let circlePath = CGMutablePath()
        circlePath.addEllipse(in: layerView2.bounds)
        layerView2.layer.shadowPath = circlePath
        
        let image = UIImage(named: "Cone.png")
        layerView1.layer.contents = image?.cgImage
        layerView2.layer.contents = image?.cgImage
        layerView1.layer.contentsGravity = kCAGravityResizeAspect
        layerView1.layer.contentsScale = image?.scale ?? 0
        layerView2.layer.contentsGravity = kCAGravityResizeAspect
        layerView2.layer.contentsScale = image?.scale ?? 0
    }

}
