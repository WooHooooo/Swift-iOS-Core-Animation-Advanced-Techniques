//
//  Transition.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/25.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class Transition: UIViewController {

    @IBOutlet weak var imageView:UIImageView!
    var images:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        guard let image1 =  UIImage(named:"Anchor") else {
            return
        }
        images.append(image1)
        guard let image2 =  UIImage(named:"Cone") else {
            return
        }
        images.append(image2)
        guard let image3 =  UIImage(named:"Igloo") else {
            return
        }
        images.append(image3)
        guard let image4 =  UIImage(named:"Spaceship") else {
            return
        }
        images.append(image4)
    }
    
    @IBAction func switchImage(_ sender: UIButton){
        //CATransition 过渡
//        let transition = CATransition()
//        transition.type = kCATransitionFade
//        imageView.layer.add(transition, forKey: nil)
//
//        guard let currentImage = imageView.image,var index = images.index(of: currentImage) else{
//            return
//        }
//        index  = (index + 1) % images.count
//        imageView.image = images[index]
        
        //UIView 过渡
        UIView.transition(with: imageView, duration: 1.0, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            guard let currentImage = self.imageView.image,var index = self.images.index(of: currentImage) else{
                return
            }
            index  = (index + 1) % self.images.count
            self.imageView.image = self.images[index]
        }, completion: nil)
    }

}
