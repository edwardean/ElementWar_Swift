//
//  HomeController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/7.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit
import SnapKit

class HomeController: UIViewController {
    private let portraitView = PortraitView(isMe: false)
    private let entryView = EntryView()
    private let myProbabilityView = MyProbabilityView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .black
        
        /********************************************************************/
        
        portraitView.backgroundColor = .gray
        self.view.addSubview(portraitView)
        
        portraitView.snp.makeConstraints { (make) in
            make.top.leading.bottom.equalTo(0)
            make.width.equalToSuperview().dividedBy(3)
        }
        
        entryView.backgroundColor = .magenta
        self.view.addSubview(entryView)
        
        entryView.snp.makeConstraints { (make) in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(portraitView.snp.trailing)
        }
        
        myProbabilityView.backgroundColor = .purple
        self.view.addSubview(myProbabilityView)
        
        myProbabilityView.snp.makeConstraints { (make) in
            make.top.equalTo(entryView.snp.bottom)
            make.leading.equalTo(portraitView.snp.trailing)
            make.trailing.bottom.equalTo(0)
            make.height.equalTo(50)
        }
        
        let settingButton = UIButton(type: .custom)
        settingButton.clipsToBounds = true
        settingButton.layer.cornerRadius = 33
        settingButton.backgroundColor = .cyan
        settingButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        settingButton.setTitleColor(.white, for: .normal)
        settingButton.setTitle("设置", for: .normal)
        self.view.addSubview(settingButton)
        
        settingButton.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.trailing.equalTo(-10)
            make.width.height.equalTo(66)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
