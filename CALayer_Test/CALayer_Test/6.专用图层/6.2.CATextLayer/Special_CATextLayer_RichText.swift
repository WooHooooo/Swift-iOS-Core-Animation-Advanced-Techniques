//
//  Special_CATextLayer_RichText.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/22.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import UIKit

class Special_CATextLayer_RichText: UIViewController {
    fileprivate lazy var simpleView:UIView = {
        [weak self] in
        var aView = UIView(frame:CGRect(x:(self?.view.bounds.width)!/8,y:(self?.view.bounds.height)!/5,width:(self?.view.bounds.width)!*6/8,height:(self?.view.bounds.height)!*3/5))
        return aView
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDismissButton()
        let textLayer = CATextLayer()
        textLayer.frame = simpleView.bounds
        textLayer.contentsScale = UIScreen.main.scale
        simpleView.layer.addSublayer(textLayer)
        
        textLayer.alignmentMode = kCAAlignmentJustified
        textLayer.isWrapped = true
        
        let font = UIFont.systemFont(ofSize: 15)
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing  elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar    leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel     fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet    lobortis"
        
        let string = NSMutableAttributedString.init(string: text)
        var attribs = [NSAttributedStringKey.foregroundColor:UIColor.black.cgColor,NSAttributedStringKey.font: font] as [NSAttributedStringKey : Any]
        string.setAttributes(attribs, range: NSMakeRange(0, text.lengthOfBytes(using: String.Encoding.utf8)))
        
        attribs = [NSAttributedStringKey.foregroundColor:UIColor.red.cgColor,
                   NSAttributedStringKey.font:font]
        string.setAttributes(attribs, range: NSMakeRange(6, 5))
        textLayer.string = string
        
        view.addSubview(simpleView)
    }
}
