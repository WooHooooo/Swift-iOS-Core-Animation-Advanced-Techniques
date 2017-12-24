//
//  LayerLabel_test.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/22.
//  Copyright © 2017年 吴昊. All rights reserved.
//


/*
 CATextLayer是CALayer的子类，它以图层的形式包含了UILabel几乎所有的绘制特性，并且额外提供了一些新的特性。
 CATextLayer也要比UILabel渲染得快得多
 UILabel其实是通过WebKit来实现绘制的
 而CATextLayer使用了Core text，并且渲染得非常快
 */

import UIKit

class LayerLabel:UILabel {
    override class var layerClass:AnyClass {
        get {
            return CATextLayer.self
        }
    }
    
    var textLayer: CATextLayer {
        return self.layer as! CATextLayer
    }
    
    func setUp(){
        textLayer.alignmentMode = kCAAlignmentJustified
        
        textLayer.isWrapped = true
        layer.display()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUp()
    }
    
    override var text: String? {
        didSet {
            super.text = text
            textLayer.string = text
        }
    }
    
    override var textColor: UIColor! {
        didSet {
            super.textColor = textColor
            textLayer.foregroundColor = textColor.cgColor
        }
    }
    
    override var font: UIFont! {
        didSet {
            super.font = font
            // 设置字体
            textLayer.font = CTFontCreateWithName(font.fontName as CFString, font.pointSize, nil)
            // 字体大小
            textLayer.fontSize = font.pointSize
        }
    }
    
    
}

class LayerLabel_test: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        super.viewDidLoad()
        
        // 初始化textLayer
        let textLayer = CATextLayer()
        textLayer.backgroundColor = UIColor.lightGray.cgColor
        
        textLayer.frame = CGRect(x: 20, y: 50, width: view.bounds.width-40, height: 300)
        // 显示清楚字体
        textLayer.contentsScale = UIScreen.main.scale
        view.layer.addSublayer(textLayer)
        
        // 设置textLayer的属性
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.alignmentMode = kCAAlignmentJustified
        // 设置文字适配bounds大小，string类型：start/middle/end/none
        textLayer.truncationMode = kCATruncationStart
        textLayer.isWrapped = true
        
        // 设置字体
        let font = UIFont.systemFont(ofSize: 15)
        let fontName = font.fontName
        let fontRef = CGFont(fontName as CFString)
        textLayer.font = fontRef
        // 字体大小
        textLayer.fontSize = font.pointSize
        
        let text = "人没有的牺牲的话就什么也得不到，为了得到某些东西，就必须付出同等的代价，这就是炼金术的“等价交换”原则，那是我们坚信，那就是世界的真实！"
        // set layer text
        textLayer.string = text
        
        
        
        let layerLabel = LayerLabel()
        layerLabel.text = "没有伴随着伤痛的教训就没有意义，因为人没有牺牲就不会有收获，然而，当战胜这痛楚时，人就将获得不屈服任何事物的坚强之心，是的，钢铁般的心！"
        layerLabel.textColor = UIColor.red
        layerLabel.font = UIFont.systemFont(ofSize: 17)
        layerLabel.frame = CGRect(x: 20, y: 400, width: 300, height: 100)
        view.addSubview(layerLabel)
    }

}
