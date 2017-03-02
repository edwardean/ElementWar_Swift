//
//  MagicianDetailController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/7.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

/// 法师详情

import UIKit
import SnapKit
import Kingfisher
import EWModel_Swift
import EWDataCenter_Swift

class MagicianDetailController: UIViewController {
    public var magicianID: String = "" /// 魔法师ID
    private let portraitView = PortraitView(isMe: false)
    private let probabilityView = ProbabilityView()
    
    override func viewDidLoad() {
        portraitView.backgroundColor = .gray
        self.view.addSubview(portraitView)
        
        portraitView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(0)
            make.width.equalToSuperview().dividedBy(3)
        }
        
        probabilityView.backgroundColor = .purple
        self.view.addSubview(probabilityView)
        
        probabilityView.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(portraitView.snp.right)
        }
        
        let battleButton = UIButton(type: .custom)
        battleButton.clipsToBounds = true
        battleButton.layer.cornerRadius = 33
        battleButton.backgroundColor = .cyan
        battleButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        battleButton.setTitleColor(.white, for: .normal)
        battleButton.setTitle("战斗", for: .normal)
        self.view.addSubview(battleButton)
        
        battleButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(-10)
            make.right.equalTo(-10)
            make.width.height.equalTo(66)
        }
        
        requestMagicianDetail(magicianID: magicianID)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func requestMagicianDetail(magicianID: String) {
        let magicianDetailService = MagicianDetailService()
        magicianDetailService.magicianID = magicianID
        magicianDetailService.active(Success: { (magician) in
            self.portraitView.nameLabel.text = magician.nickname
            self.portraitView.portraitImageView.kf.setImage(with: URL(string: magician.portrait))
            self.portraitView.honorLabel.text = magician.honor
            self.portraitView.mottoLabel.text = magician.motto
            
            self.probabilityView.winPerLabel.text = "99.59%"
            self.probabilityView.manSynPerLabel.text = "99.59%"
            self.probabilityView.autoSynPerLabel.text = "99.59%"
            self.probabilityView.rankLabel.text = "魔法大陆第一"
        }, Failure: { (error) in
            self.navigationController?.popViewController(animated: true)
        })
    }
}
