//
//  UIViewCAMediaTimingFunction.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/25.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class UIViewCAMediaTimingFunction: UIViewController {
    var colorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        colorView = UIView()
        colorView.bounds = CGRect(x:0,y:0,width:100,height:100)
        colorView.center = CGPoint(x:view.bounds.size.width / 2,y:view.bounds.size.height / 2)
        colorView.backgroundColor = UIColor.red
        view.addSubview(colorView)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            guard let point = touches.first?.location(in: self.view) else {
                return
            }
            self.colorView.center = point
        }, completion: nil)
    }

}
