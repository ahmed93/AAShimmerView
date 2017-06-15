//
//  ViewController.swift
//  AAShimmerView
//
//  Created by Ahmed Mohamed Magdi on 06/11/2017.
//  Copyright (c) 2017 Ahmed Mohamed Magdi. All rights reserved.
//

import UIKit
import AAShimmerView

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = imageView.frame.width/2
        
        label1.aaShimmerHeight = label1.frame.height/2
        label2.aaShimmerHeight = label2.frame.height/2
        label3.aaShimmerHeight = label3.frame.height/2
        label4.aaShimmerHeight = label4.frame.height/2
        
        containerView.aaShimmerSubViews = [label1, label2, label3, label4, imageView]
        containerView.startShimmering()
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { [unowned self] (_) in
            if self.containerView.isShimmering {
                self.containerView.stopShimmering()
            }else {
                self.containerView.startShimmering()
            }
        }
    }
}

