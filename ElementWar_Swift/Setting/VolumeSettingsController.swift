//
//  VolumeSettingsController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/8.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit

class VolumeSettingsController: UIAlertController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let backgroundSoundSettingAction = UIAlertAction(title: "背景音设置", style: .default) { (action) in
            
        }
        self.addAction(backgroundSoundSettingAction)
        
        let playSoundSettingAction = UIAlertAction(title: "游戏设置", style: .default) { (action) in
            
        }
        self.addAction(playSoundSettingAction)
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
