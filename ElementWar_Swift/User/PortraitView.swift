//
//  PortraitView.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/19.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

/// 肖像视图，用于显示用户名称，头像，称号，座右铭

import UIKit
import SnapKit
import BlocksKit

class PortraitView: UIView {
    var delegate: PortraitViewDelegate? = nil
    
    var nameLabel = UILabel() /// 姓名
    var portraitImageView = UIImageView() /// 头像
    var honorLabel = UILabel() /// 称号
    var mottoLabel = UILabel() /// 座右铭
    
    init(isMe me: Bool) {
        super.init(frame: .zero)
        
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .white
        nameLabel.text = "Bloody Lucifer"
        self.addSubview(nameLabel)
        
        let portraitImage = UIImage(named: "")
        portraitImageView.image = portraitImage
        portraitImageView.backgroundColor = .red
        self.addSubview(portraitImageView)
        
        honorLabel.backgroundColor = .orange
        honorLabel.textColor = .white
        honorLabel.text = "战神"
        self.addSubview(honorLabel)
        
        mottoLabel.textColor = .white
        mottoLabel.text = "可怜的虫子们啊，都嚎叫着粉碎在我愤怒的火焰中吧！"
        self.addSubview(mottoLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(0)
            make.height.equalTo(44)
        }
        
        portraitImageView.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(portraitImageView.snp.width)
        }
        
        honorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(portraitImageView.snp.bottom)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(44)
        }
        
        mottoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(honorLabel.snp.bottom)
            make.leading.trailing.bottom.equalTo(0)
        }
        
        if me {
            nameLabel.bk_(whenTapped: {
                [unowned self] in
                self.delegate?.PortraitViewTapped(onNameLabel: self.nameLabel)
            })
            
            portraitImageView.bk_(whenTapped: {
                [unowned self] in
                self.delegate?.PortraitViewTapped(onPortraitImageView: self.portraitImageView)
            })
            
            mottoLabel.bk_(whenTapped: {
                [unowned self] in
                self.delegate?.PortraitViewTapped(onMottoLabel: self.mottoLabel)
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol PortraitViewDelegate {
    func PortraitViewTapped(onNameLabel: UILabel)
    func PortraitViewTapped(onPortraitImageView: UIImageView)
    func PortraitViewTapped(onMottoLabel: UILabel)
}
