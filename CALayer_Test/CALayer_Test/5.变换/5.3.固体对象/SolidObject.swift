//
//  SolidObject.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/21.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class SolidObject: UIViewController {
    @IBOutlet var faces:[UIView]!
    @IBOutlet weak var containerView:UIView!
    
    func addFace(index:Int,transform: CATransform3D){
        let face = faces[index]
        containerView.addSubview(face)
        let containerSize = containerView.bounds.size
        face.center = CGPoint(x:containerSize.width / 2.0,y:containerSize.height / 2.0)
        face.layer.transform = transform
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0 / 500.0
        perspective = CATransform3DRotate(perspective, -CGFloat(Double.pi)/4, 1, 0, 0)
        perspective = CATransform3DRotate(perspective, -CGFloat(Double.pi)/4, 0, 1, 0)
        containerView.layer.sublayerTransform = perspective
        
        var transform = CATransform3DMakeTranslation(0, 0, 100)
        addFace(index: 0, transform: transform)
        
        transform = CATransform3DMakeTranslation(100, 0, 0)
        transform = CATransform3DRotate(transform, CGFloat(Double.pi / 2), 0, 1, 0)
        addFace(index: 1, transform: transform)
        
        transform = CATransform3DMakeTranslation(0, -100, 0)
        transform = CATransform3DRotate(transform, CGFloat(Double.pi / 2), 1, 0, 0)
        addFace(index: 2, transform: transform)
        
        transform = CATransform3DMakeTranslation(0, 100, 0)
        transform = CATransform3DRotate(transform, -CGFloat(Double.pi / 2), 1, 0, 0)
        addFace(index: 3, transform: transform)
        
        transform = CATransform3DMakeTranslation(-100, 0, 0)
        transform = CATransform3DRotate(transform, -CGFloat(Double.pi / 2), 0, 1, 0)
        addFace(index: 4, transform: transform)
        
        transform = CATransform3DMakeTranslation(0, 0, -100)
        transform = CATransform3DRotate(transform, CGFloat(Double.pi), 0, 1, 0)
        addFace(index: 5, transform: transform)
        
    }
}
