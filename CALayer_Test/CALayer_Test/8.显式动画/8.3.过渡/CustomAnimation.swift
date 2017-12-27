//
//  CustomAnimation.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/25.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class CustomAnimation: UIViewController {
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
    }
    
    @IBAction func performTransition(_ sender:UIButton) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        view.layer.render(in: context)
        let coverImage = UIGraphicsGetImageFromCurrentImageContext()
        let coverView = UIImageView.init(image: coverImage)
        coverView.frame = view.bounds
        view.addSubview(coverView)
        
        let red = CGFloat(arc4random_uniform(255))/255
        let green = CGFloat(arc4random_uniform(255))/255
        let blue = CGFloat(arc4random_uniform(255))/255
        view.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
        
        UIView.animate(withDuration: 1.0, animations: {
            let transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
            transform.rotated(by: CGFloat(Double.pi/2))
            coverView.transform = transform
            coverView.alpha = 0.0
        }) { (finished) in
            coverView.removeFromSuperview()
        }
    }

}
