//
//  Stretch&Filte.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/21.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

class Stretch_Filte: UIViewController {
    
    @IBOutlet var digitViews:[UIView]!
    weak var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        let digits = UIImage(named: "Digits.png")
        digitViews.forEach{ (path) in
            path.layer.contents = digits?.cgImage
            path.layer.contentsRect = CGRect(x:0,y:0,width:0.1,height:1.0)
            path.layer.contentsGravity = kCAGravityResizeAspect
            path.layer.magnificationFilter = kCAFilterNearest
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        
        self.tick()
    }

    func setDigit(digit: Int,view: UIView){
        view.layer.contentsRect = CGRect(x:CGFloat(digit) * 0.1,y:0,width:0.1,height:1.0)
    }
    
    @objc func tick(){
        let calendar = Calendar(identifier:.gregorian)
        let units = Set<Calendar.Component>([.hour,.minute,.second])
        let components = calendar.dateComponents(units, from: Date())
        
        setDigit(digit: (components.hour ?? 0) / 10, view: digitViews[0])
        setDigit(digit: (components.hour ?? 0) % 10, view: digitViews[1])
        
        setDigit(digit: (components.minute ?? 0) / 10, view: digitViews[2])
        setDigit(digit: (components.minute ?? 0) % 10, view: digitViews[3])
        
        setDigit(digit: (components.second ?? 0) / 10, view: digitViews[4])
        setDigit(digit: (components.second ?? 0) % 10, view: digitViews[5])
    }
}
