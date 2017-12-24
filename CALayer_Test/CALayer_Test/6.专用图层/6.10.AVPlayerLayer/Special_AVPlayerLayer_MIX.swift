//
//  Special_AVPlayerLayer_MIX.swift
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/24.
//  Copyright © 2017年 吴昊. All rights reserved.
//

import Foundation
import AVFoundation
import QuartzCore
import UIKit

class Special_AVPlayerLayer_MIX:UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
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
        var transform = CATransform3DIdentity
        transform.m34 = -1.0/500.0
        transform = CATransform3DRotate(transform, CGFloat(Double.pi/4), 1, 1, 0)
        playerLayer.transform = transform
        
        playerLayer.masksToBounds = true
        playerLayer.cornerRadius = 20.0
        playerLayer.borderColor = UIColor.red.cgColor
        playerLayer.borderWidth = 5.0
        
        player.play()
        
    }
}
