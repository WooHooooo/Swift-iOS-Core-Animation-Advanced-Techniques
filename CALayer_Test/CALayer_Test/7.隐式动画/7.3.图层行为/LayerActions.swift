//
//  LayerActions.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/24.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class LayerActions: UIViewController {
    @IBOutlet weak var layerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
//        print("Outside: %@", layerView.action(for: layerView.layer, forKey: "backgroundColor"))
//        UIView.beginAnimations(nil, context: nil)
//        print("Inside: %@", layerView.action(for: layerView.layer, forKey: "backgroundColor"))
        layerView.layer.backgroundColor = UIColor.blue.cgColor
        
    }
    
    @IBAction func changeColor(_ sender: Any) {
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        let red = CGFloat(arc4random_uniform(255))/255
        let green = CGFloat(arc4random_uniform(255))/255
        let blue = CGFloat(arc4random_uniform(255))/255
        layerView.layer.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0).cgColor
        CATransaction.commit()
    }

}
