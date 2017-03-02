//
//  SettingsController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/7.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit

class SettingsController: UIAlertController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let volumeSettingAction = UIAlertAction(title: "声音设置", style: .default) { (action) in
            let volumeSettingsController = VolumeSettingsController()
            self.present(volumeSettingsController, animated: true, completion: nil)
        }
        self.addAction(volumeSettingAction)
        
        let playSettingAction = UIAlertAction(title: "出牌设置", style: .default) { (action) in
            
        }
        self.addAction(playSettingAction)
        
        let aboutAction = UIAlertAction(title: "关于", style: .default) { (action) in
            
        }
        self.addAction(aboutAction)
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
