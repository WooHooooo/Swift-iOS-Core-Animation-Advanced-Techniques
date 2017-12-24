//
//  Special_AVPlayerLayer.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/24.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import AVFoundation
import QuartzCore
import UIKit

class Special_AVPlayerLayer:UIViewController {
    
    fileprivate lazy var containerView:UIView = {
        [weak self] in
        var aView = UIView(frame:CGRect(x:(self?.view.bounds.width)!/8,y:(self?.view.bounds.height)!/7,width:(self?.view.bounds.width)!*6/8,height:(self?.view.bounds.height)!*3/5))
        aView.isMultipleTouchEnabled = false
        aView.isUserInteractionEnabled = false
        return aView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        
        guard let url = Bundle.main.url(forResource: "Ship", withExtension: "mp4") else {
            return
        }
        let player = AVPlayer.init(url: url)
        let playerLayer = AVPlayerLayer.init(player: player)
        playerLayer.frame = containerView.bounds
        containerView.layer.addSublayer(playerLayer)
        view.addSubview(containerView)
    }
}
