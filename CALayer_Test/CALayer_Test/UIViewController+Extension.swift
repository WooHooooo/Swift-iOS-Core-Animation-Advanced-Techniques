//
//  UIViewController+Extension.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/19.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func addDismissButton(){
        self.view.layer.backgroundColor = UIColor.gray.cgColor
        let dismissButton = UIButton(frame: CGRect(x:view.bounds.width/5,y:view.bounds.height*11/13,width:view.bounds.width*3/5,height:view.bounds.height/13))
        dismissButton.layer.backgroundColor = UIColor.darkGray.cgColor
        dismissButton.tintColor = UIColor.white
        dismissButton.setTitle("返回列表", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissView(_:)), for: .touchUpInside)
        view.addSubview(dismissButton)
    }
    
    @objc func dismissView(_ button:UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}
