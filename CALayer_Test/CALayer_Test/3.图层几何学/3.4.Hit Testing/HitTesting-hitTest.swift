//
//  HitTesting-hitTest.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/20.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit

class HitTesting_hitTest:UIViewController {
    
    fileprivate lazy var simpleView:UIView = {
        [weak self] in
        var aView = UIView(frame:CGRect(x:(self?.view.bounds.width)!*2.5/8,y:(self?.view.bounds.height)!/5,width:(self?.view.bounds.width)!*3/8,height:(self?.view.bounds.height)!*1.3/5))
        aView.backgroundColor = UIColor.white
        return aView
        }()
    
    fileprivate lazy var blueLayer:CALayer = {
        [weak self] in
        var aLayer = CALayer()
        aLayer.frame = CGRect(x: (self?.view.bounds.width)!/8,y: (self?.view.bounds.height)!*0.3/5, width: (self?.view.bounds.width)!/8,height: (self?.view.bounds.height)!*0.7/5)
        aLayer.backgroundColor = UIColor.blue.cgColor
        return aLayer
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        simpleView.layer.addSublayer(self.blueLayer)
        view.addSubview(simpleView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: view) ?? CGPoint()
        let layer = simpleView.layer.hitTest(point)
        if layer == blueLayer {
            let alert = UIAlertController(title: "触点在蓝方块里!", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if layer == simpleView.layer{
            let alert = UIAlertController(title: "触点在白方块里!", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
