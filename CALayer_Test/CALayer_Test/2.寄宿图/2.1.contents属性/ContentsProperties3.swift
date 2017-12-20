//
//  ContentsProperties3.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/20.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit

class ContentsProperties3:UIViewController {
    fileprivate lazy var button1:UIView = {
        [weak self] in
        let aButton = UIView(frame:CGRect(x:(self?.view.bounds.width)!/3,y:(self?.view.bounds.height)!/5,width:(self?.view.bounds.width)!/3,height:(self?.view.bounds.height)!/5))
        return aButton
    }()
    
    fileprivate lazy var button2:UIView = {
        [weak self] in
        let aButton = UIView(frame:CGRect(x:(self?.view.bounds.width)!/3,y:(self?.view.bounds.height)!*2/5,width:(self?.view.bounds.width)!/3,height:(self?.view.bounds.height)!/5))
        return aButton
    }()
    
    fileprivate func addStretchableImage(image: UIImage,rect: CGRect,layer: CALayer){
        layer.contents = image.cgImage
        layer.contentsCenter = rect
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        let image = UIImage(named: "Button.png")
        [button1,button2].forEach{[weak self] (path) in
            addStretchableImage(image: image ?? UIImage(), rect: CGRect(x:0.25,y:0.25,width:0.5,height:0.5), layer: path.layer)
            self?.view.addSubview(path)
        }
    }
}
