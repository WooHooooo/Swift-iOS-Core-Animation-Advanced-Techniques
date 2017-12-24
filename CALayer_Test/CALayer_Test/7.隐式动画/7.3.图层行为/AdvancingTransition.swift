//
//  AdvancingTransition.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/24.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class AdvancingTransition: UIViewController {

    @IBOutlet weak var layerView: UIView!
    var colorLayer:CALayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        colorLayer = CALayer()
        colorLayer.frame = CGRect(x:50.0,y:50.0,width:100.0,height:100.0)
        colorLayer.backgroundColor = UIColor.blue.cgColor
        
        let transition = CATransition()
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        colorLayer.actions = ["backgroundColor": transition]
        
        layerView.layer.addSublayer(colorLayer)
    }
    
    @IBAction func changeColor(_ sender: Any) {
        
        let red = CGFloat(arc4random_uniform(255))/255
        let green = CGFloat(arc4random_uniform(255))/255
        let blue = CGFloat(arc4random_uniform(255))/255
        colorLayer.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0).cgColor
    }

}
