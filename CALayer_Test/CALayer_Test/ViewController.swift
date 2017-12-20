//
//  ViewController.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/19.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import UIKit

let headerTitles = ["1.图层树","2.寄宿图","3.图层几何学","4.视觉效果","5.变换"]

let rowTitles = [["1.3.使用图层"],
                 ["2.1.contents属性-图片适应","2.1.contents属性-图片切割","2.1.contents属性-图片拉伸","2.2.Custom Drawing-子图层重绘"],
                 [],[],[]]

let detailView:[[UIViewController]] = [[UseLayer()],[ContentsProperties1(),ContentsProperties2(),ContentsProperties3(),CustomDrawing()],[],[],[]]

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
