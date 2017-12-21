//
//  ContentsProperties2.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/20.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit
class ContentsProperties2: UIViewController {
    
    fileprivate lazy var coneView:UIView = {
        [weak self] in
        let aView = UIView(frame:CGRect(x:(self?.view.bounds.width)!/8,y:(self?.view.bounds.height)!/5,width:(self?.view.bounds.width)!*2.5/8,height:(self?.view.bounds.height)!*1.3/5))
        aView.backgroundColor = UIColor.white
        return aView
        }()
    
    fileprivate lazy var shipView:UIView = {
        [weak self] in
        let aView = UIView(frame:CGRect(x:(self?.view.bounds.width)!*4.5/8,y:(self?.view.bounds.height)!/5,width:(self?.view.bounds.width)!*2.5/8,height:(self?.view.bounds.height)!*1.3/5))
        aView.backgroundColor = UIColor.white
        return aView
        }()
    
    fileprivate lazy var iglooView:UIView = {
        [weak self] in
        let aView = UIView(frame:CGRect(x:(self?.view.bounds.width)!/8,y:(self?.view.bounds.height)!*2.7/5,width:(self?.view.bounds.width)!*2.5/8,height:(self?.view.bounds.height)!*1.3/5))
        aView.backgroundColor = UIColor.white
        return aView
        }()
    
    fileprivate lazy var anchorView:UIView = {
        [weak self] in
        let aView = UIView(frame:CGRect(x:(self?.view.bounds.width)!*4.5/8,y:(self?.view.bounds.height)!*2.7/5,width:(self?.view.bounds.width)!*2.5/8,height:(self?.view.bounds.height)!*1.3/5))
        aView.backgroundColor = UIColor.white
        return aView
        }()
    
    fileprivate func addSpriteImage(image: UIImage,rect: CGRect,layer: CALayer){
        layer.contents = image.cgImage
        layer.contentsGravity = kCAGravityResizeAspect
        layer.contentsRect = rect
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        let image = UIImage(named: "Sprites.png")
        addSpriteImage(image: image ?? UIImage(), rect: CGRect(x:0,y:0,width:0.5,height:0.5), layer: self.coneView.layer)
        addSpriteImage(image: image ?? UIImage(), rect: CGRect(x:0.5,y:0,width:0.5,height:0.5), layer: self.shipView.layer)
        addSpriteImage(image: image ?? UIImage(), rect: CGRect(x:0,y:0.5,width:0.5,height:0.5), layer: self.iglooView.layer)
        addSpriteImage(image: image ?? UIImage(), rect: CGRect(x:0.5,y:0.5,width:0.5,height:0.5), layer: self.anchorView.layer)
        [coneView,shipView,iglooView,anchorView].forEach(self.view.addSubview)
    }
    
    
}
