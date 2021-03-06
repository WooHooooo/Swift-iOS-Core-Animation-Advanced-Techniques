//
//  ContentsProperties.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/19.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit
class ContentsProperties1: UIViewController {
    
    lazy var simpleView:UIView = {
        [weak self] in
        let aView = UIView(frame:CGRect(x:(self?.view.bounds.width)!*2.5/8,y:(self?.view.bounds.height)!/5,width:(self?.view.bounds.width)!*3/8,height:(self?.view.bounds.height)!*1.3/5))
        aView.backgroundColor = UIColor.white
        let image = UIImage(named: "Snowman.png")
        aView.layer.contents = image?.cgImage
        aView.layer.contentsGravity = kCAGravityCenter
        aView.layer.contentsScale = image?.scale ?? 0
        aView.layer.masksToBounds = true
        return aView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        view.addSubview(simpleView)
    }
    
}
