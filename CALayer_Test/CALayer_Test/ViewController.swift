//
//  ViewController.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/19.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

let headerTitles = ["1.图层树","2.寄宿图","3.图层几何学","4.视觉效果","5.变换","6.专用图层","7.隐式动画","8.显式动画","9.图层时间","10.缓冲","11.基于定时器的动画","12.性能调优","13.高效绘图","14.图像IO","15.图层性能"]

let rowTitles = [
                    ["1.3.使用图层"],
                    ["2.1.contents属性-图片适应","2.1.contents属性-图片切割","2.1.contents属性-图片拉伸","2.2.Custom Drawing-子图层重绘"],
                    ["3.2.锚点","3.3.坐标系","3.4.Hit Testing-containsPoint","3.4.Hit Testing-hitTest"],
                    ["4.1.圆角","4.2.图层边框","4.3.阴影-剪裁","4.3.阴影-shadowPath","4.4.图层蒙版","4.5.拉伸过滤","4.6.组透明"],
                    ["5.1.仿射变换","5.1.仿射变换-混合","5.2.3D变换","5.2.3D变换-sublayer","5.2.3D变换-sublayerRotation1","5.2.3D变换-sublayerRotation2","5.3.固体对象","5.3.固体对象-光影"],
                    ["6.1.CAShapeLayer","6.2.CATextLayer","6.2.CATextLayer-富文本","6.2.LayerLabel","6.3.CATransformLayer","6.4.CAGradientLayer","6.5.CAReplicatorLayer","6.5.ReflectionView","6.8.CAEmitterLayeer","6.9.CAEAGLLayer","6.10.AVPlayerLayer","6.10.AVPlayerLayer_MIX"],
                    ["7.1.事务","7.2.完成块","7.3.图层行为","7.3.涂层行为-推进过渡","7.4.呈现与模型"],
                    [],
                    [],
                    [],
                    [],
                    [],
                    [],
                    [],
                    []
                ]

let detailView:[[UIViewController]] = [
    [
        UseLayer()
    ],
    [
        ContentsProperties1(),ContentsProperties2(),ContentsProperties3(),CustomDrawing()],
    [
        AnchorPoint(),CoordinateSystem(),HitTesting_containsPoint(),HitTesting_hitTest()
    ],
    [
        ConrnerRadius(),LayerBorder(),Shadow(),ShadowPath(),LayerMask(),Stretch_Filte(),Rasterize()
    ],
    [
        AffineTransform(),AffineTransformConcat(),Transform_m34(),Transform_sublayer(),Transform_Rotation1(),Transform_Rotation2(),SolidObject(),SolidObject_Shadow()
    ],
    [
        Special_CAShapeLayer(),Special_CATextLayer(),Special_CATextLayer_RichText(),LayerLabel_test(),Special_CATransformLayer(),Special_CAGradientLayer(),Special_CAReplicatorLayer(),ReflectionView_test(),Special_CAEmitterLayeer(),Special_CAEAGLLayer_OC(),Special_AVPlayerLayer(),Special_AVPlayerLayer_MIX()
    ],
    [
        Transactions(),Completion_Blocks(),LayerActions(),AdvancingTransition(),PresentationLayer()
    ]
]

class ViewController: UIViewController {

    fileprivate lazy var tableView:UITableView = {
        [weak self] in
        let aTableView = UITableView(frame:self?.view.bounds ?? CGRect(x:0,y:0,width:0,height:0),style: .plain)
        aTableView.layer.backgroundColor = UIColor.gray.cgColor
        aTableView.delegate = self
        aTableView.dataSource = self
        aTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        return aTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.present(detailView[indexPath.section][indexPath.row], animated: true, completion: nil)
    }
}

extension ViewController:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowTitles[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default,reuseIdentifier: "CALayer_Cell")
        cell.textLabel?.text = rowTitles[indexPath.section][indexPath.row]
        cell.selectionStyle = .default
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
