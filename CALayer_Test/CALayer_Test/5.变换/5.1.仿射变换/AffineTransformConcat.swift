//
//  AffineTransformConcat.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/21.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit

class AffineTransformConcat: UIViewController {
    
    lazy var simpleView:UIView = {
        [weak self] in
        let aView = UIView(frame:CGRect(x:(self?.view.bounds.width)!*2.5/8,y:(self?.view.bounds.height)!/5,width:(self?.view.bounds.width)!*3/8,height:(self?.view.bounds.height)!*1.3/5))
        aView.backgroundColor = UIColor.white
        let image = UIImage(named: "Snowman.png")
        aView.layer.contents = image?.cgImage
        aView.layer.contentsGravity = kCAGravityResizeAspect
        aView.layer.contentsScale = image?.scale ?? 0
        return aView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        let transform = CGAffineTransform(scaleX: 0.5, y: 0.5).rotated(by: CGFloat(Double.pi/180.0*30.0)).translatedBy(x: 200, y: 0)
        simpleView.layer.setAffineTransform(transform)
        view.addSubview(simpleView)
    }
}
