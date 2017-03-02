//
//  EntryView.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/19.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit

class EntryView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let battleButton = UIButton(type: .custom)
        battleButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        battleButton.setTitleColor(.white, for: .normal)
        battleButton.setTitle("战斗", for: .normal)
        self.addSubview(battleButton)
        
        let rankButton = UIButton(type: .custom)
        rankButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rankButton.setTitleColor(.white, for: .normal)
        rankButton.setTitle("伟大的法师们", for: .normal)
        self.addSubview(rankButton)
        
        let elementButton = UIButton(type: .custom)
        elementButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        elementButton.setTitleColor(.white, for: .normal)
        elementButton.setTitle("元素之书", for: .normal)
        self.addSubview(elementButton)
        
        let scrollButton = UIButton(type: .custom)
        scrollButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        scrollButton.setTitleColor(.white, for: .normal)
        scrollButton.setTitle("魔法卷轴", for: .normal)
        self.addSubview(scrollButton)
        
        let epicButton = UIButton(type: .custom)
        epicButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        epicButton.setTitleColor(.white, for: .normal)
        epicButton.setTitle("史诗", for: .normal)
        self.addSubview(epicButton)
        
        battleButton.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(44)
        }
        
        rankButton.snp.makeConstraints { (make) in
            make.top.equalTo(battleButton.snp.bottom)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(44)
        }
        
        elementButton.snp.makeConstraints { (make) in
            make.top.equalTo(rankButton.snp.bottom)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(44)
        }
        
        scrollButton.snp.makeConstraints { (make) in
            make.top.equalTo(elementButton.snp.bottom)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(44)
        }
        
        epicButton.snp.makeConstraints { (make) in
            make.top.equalTo(scrollButton.snp.bottom)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(44)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
