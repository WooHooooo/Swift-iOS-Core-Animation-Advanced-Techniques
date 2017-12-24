//
//  ScrollView.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/23.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit

class ScrollView: UIView {
    override class var layerClass: AnyClass {
        get {
            return CAScrollLayer.self
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        // enable clipping
        layer.masksToBounds = true
        
        // attach pan gesture recognizer
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panAction))
        addGestureRecognizer(panGesture)
    }
    
    @objc func panAction(recognizer: UIPanGestureRecognizer)  {
        
        var offset: CGPoint = bounds.origin
        
        switch recognizer.state {
        case .changed:
            
            offset.x = -recognizer.translation(in: self).x
            offset.y = -recognizer.translation(in: self).y
            
            let newLayer = layer as! CAScrollLayer
            newLayer.scroll(to: offset)
            
            newLayer.scrollRectToVisible(self.bounds)
            
        case .ended:
            recognizer.setTranslation(CGPoint.zero, in: self)
            
        default: break
        }
        
    }
}
