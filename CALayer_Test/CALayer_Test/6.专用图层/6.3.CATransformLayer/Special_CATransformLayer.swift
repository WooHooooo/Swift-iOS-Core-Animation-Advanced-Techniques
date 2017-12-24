//
//  Special_CATransformLayer.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/22.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit

class Special_CATransformLayer:UIViewController {
    fileprivate lazy var simpleView:UIView = {
        [weak self] in
        var aView = UIView(frame: CGRect(x:0,y:-CGFloat((self?.view.bounds)!.height/5),width:CGFloat((self?.view.bounds.width)!),height:CGFloat((self?.view.bounds.height)!)))
        return aView
        }()
    
    func faceWithTransform(transform: CATransform3D) -> CALayer {
        let face = CALayer()
        face.frame = CGRect(x:-50,y:-50,width:100,height:100)
        
        let red = CGFloat(arc4random_uniform(255))/255
        let green = CGFloat(arc4random_uniform(255))/255
        let blue = CGFloat(arc4random_uniform(255))/255
        face.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0).cgColor
        face.transform = transform
        return face
    }
    
    func cubeWithTransform(transform: CATransform3D) -> CALayer {
        let cube = CATransformLayer()
        var ct = CATransform3DMakeTranslation(0, 0, 50)
        cube.addSublayer(faceWithTransform(transform: ct))
        
        ct = CATransform3DMakeTranslation(50, 0, 0)
        ct = CATransform3DRotate(ct, CGFloat(Double.pi/2),0, 1, 0)
        cube.addSublayer(faceWithTransform(transform: ct))
        
        ct = CATransform3DMakeTranslation(0, -50, 0)
        ct = CATransform3DRotate(ct, CGFloat(Double.pi/2), 1, 0, 0)
        cube.addSublayer(faceWithTransform(transform: ct))
        
        ct = CATransform3DMakeTranslation(0, 50, 0)
        ct = CATransform3DRotate(ct, -CGFloat(Double.pi/2), 1, 0, 0)
        cube.addSublayer(faceWithTransform(transform: ct))
        
        ct = CATransform3DMakeTranslation(-50, 0, 0)
        ct = CATransform3DRotate(ct, -CGFloat(Double.pi/2), 0, 1, 0)
        cube.addSublayer(faceWithTransform(transform: ct))
        
        ct = CATransform3DMakeTranslation(0, 0, -50)
        ct = CATransform3DRotate(ct, CGFloat(Double.pi), 0, 1, 0)
        cube.addSublayer(faceWithTransform(transform: ct))
        
        let containerSize = simpleView.bounds.size
        cube.position = CGPoint(x:containerSize.width/2.0,y:containerSize.height/2.0)
        
        cube.transform = transform
        return cube
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        var pt = CATransform3DIdentity
        pt.m34 = -1.0/500.0
        simpleView.layer.sublayerTransform = pt
        
        var c1t = CATransform3DIdentity
        c1t = CATransform3DTranslate(c1t, -100, 0, 0)
        let cube1 = cubeWithTransform(transform: c1t)
        simpleView.layer.addSublayer(cube1)
        
        var c2t = CATransform3DIdentity
        c2t = CATransform3DTranslate(c2t, 100, 0, 0)
        c2t = CATransform3DRotate(c2t, -CGFloat(Double.pi/4), 1, 0, 0)
        c2t = CATransform3DRotate(c2t, -CGFloat(Double.pi/4), 0, 1, 0)
        let cube2 = cubeWithTransform(transform: c2t)
        simpleView.layer.addSublayer(cube2)
        
        view.addSubview(simpleView)
    }
}
