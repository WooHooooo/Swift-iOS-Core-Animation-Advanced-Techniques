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
        var dismissButton = UIButton(frame: CGRect(x:self.view.bounds.width/5,y:self.view.bounds.height*11/13,width:self.view.bounds.width*3/5,height:self.view.bounds.height/13))
        dismissButton.layer.backgroundColor = UIColor.darkGray.cgColor
        dismissButton.tintColor = UIColor.white
        dismissButton.setTitle("返回列表", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissView(_:)), for: .touchUpInside)
        self.view.addSubview(dismissButton)
    }
    
    @objc func dismissView(_ button:UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}
