//
//  BattleSettingsController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/7.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit

class BattleSettingsController: UIAlertController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let manualPlayAction = UIAlertAction(title: "我来出牌", style: .default) { (action) in
            
        }
        self.addAction(manualPlayAction)
        
        let autoPlayAction = UIAlertAction(title: "自动出牌", style: .default) { (action) in
            
        }
        self.addAction(autoPlayAction)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
}
