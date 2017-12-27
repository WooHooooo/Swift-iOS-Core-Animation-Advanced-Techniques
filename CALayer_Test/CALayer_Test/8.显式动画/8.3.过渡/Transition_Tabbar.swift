//
//  Transition_Tabbar.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/25.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit

class Transition_Tabbar:UIViewController,UITabBarControllerDelegate {
    var TabBarController:UITabBarController!
    var window: UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let viewController1 = AnimationGroup()
        let viewController2 = Transition()
        TabBarController = UITabBarController()
        TabBarController.viewControllers = [viewController1,viewController2]
        TabBarController.delegate = self
        window?.rootViewController = TabBarController
        window?.makeKeyAndVisible()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let transition = CATransition()
        transition.type = kCATransitionFade
        tabBarController.view.layer.add(transition, forKey: nil)
    }
}
