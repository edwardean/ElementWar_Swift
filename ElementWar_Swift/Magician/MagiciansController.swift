//
//  MagiciansController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/7.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit

class MagiciansController: UIViewController {
    
    let friendsController = FriendsController()
    let opponentsController = OpponentsController()

    let switcher = UISwitch()
    
    override func viewDidLoad() {
        view.addSubview(switcher)
        
        self.addChildViewController(friendsController)
        self.addChildViewController(opponentsController)
    }
}
