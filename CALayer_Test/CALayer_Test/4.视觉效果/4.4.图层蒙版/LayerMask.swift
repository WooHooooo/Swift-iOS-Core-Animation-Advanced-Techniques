//
//  LayerMask.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/21.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class LayerMask: UIViewController {

    @IBOutlet weak var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        let maskLayer = CALayer()
        maskLayer.frame = imageView.bounds
        let maskImage = UIImage(named:"Cone.png")
        maskLayer.contents = maskImage?.cgImage
        
        imageView.layer.mask = maskLayer
    }

}
