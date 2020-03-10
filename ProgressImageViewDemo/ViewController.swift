//
//  ViewController.swift
//  ProgressImageViewDemo
//
//  Created by Jawad Ali on 10/03/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
import ProgressImageView
class ViewController: UIViewController {

    override func viewDidLoad() {
        let progress = ProgessImageView(with: UIImage(named: "cup"), color: #colorLiteral(red: 0.4433879256, green: 0.2915558219, blue: 0.8948832154, alpha: 1), progress: 50 , animation: true)
        progress.frame = CGRect(x: 50, y: 50, width: 150, height: 150)
        progress.center = self.view.center
        progress.lineWidth = 3
        ///    progress.animationDidFinish = {  print("Animation Completed")}
        
        self.view.addSubview(progress)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

