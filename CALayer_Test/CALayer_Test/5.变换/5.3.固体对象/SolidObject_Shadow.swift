//
//  SolidObject_Shadow.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/22.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit
import GLKit

class SolidObject_Shadow: UIViewController {
    @IBOutlet var faces:[UIView]!
    @IBOutlet weak var containerView:UIView!
    
    fileprivate let AMBIENT_LIGHT:Float = 0.5
    fileprivate let LIGHT_DIRECTION = (0,1,-0.5)
    
    func applyLightingToFace(face: CALayer){
        let layer = CALayer()
        layer.frame = face.bounds
        face.addSublayer(layer)
        let transform = face.transform
        let matrix4 = GLKMatrix4.init(m: (Float(transform.m11), Float(transform.m12), Float(transform.m13), Float(transform.m14), Float(transform.m21), Float(transform.m22), Float(transform.m23), Float(transform.m24), Float(transform.m31), Float(transform.m32), Float(transform.m33), Float(transform.m34), Float(transform.m41), Float(transform.m42), Float(transform.m43), Float(transform.m44)))
        let matrix3 = GLKMatrix4GetMatrix3(matrix4)
        var normal = GLKVector3Make(0, 0, 1)
        normal = GLKMatrix3MultiplyVector3(matrix3, normal)
        normal = GLKVector3Normalize(normal)
        let light = GLKVector3Normalize(GLKVector3Make(0, 1, -0.5))
        let dotProduct = GLKVector3DotProduct(light, normal)
        let shadow = CGFloat(1 + dotProduct - AMBIENT_LIGHT)
        let color = UIColor.init(white: 0, alpha: shadow)
        layer.backgroundColor = color.cgColor
    }
    
    func addFace(index:Int,transform: CATransform3D){
        let face = faces[index]
        containerView.addSubview(face)
        let containerSize = containerView.bounds.size
        face.center = CGPoint(x:containerSize.width / 2.0,y:containerSize.height / 2.0)
        face.layer.transform = transform
        applyLightingToFace(face: face.layer)
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

