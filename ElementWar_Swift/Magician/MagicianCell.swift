//
//  MagicianCell.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/19.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit
import SnapKit
import AKUIKit
import AKViewController
import EWModel_Swift

class MagicianCell: UITableViewCell, AKTableViewCellProtocol {
    
    private var portraitIamgeView = UIImageView() /// 头像
    private var nameLabel = UILabel() /// 名字
    private var honorLabel = UILabel() /// 称号
    private var strengthLabel = UILabel() /// 实力
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(portraitIamgeView)
        
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .gray
        contentView.addSubview(nameLabel)
        
        honorLabel.font = UIFont.systemFont(ofSize: 16)
        honorLabel.textColor = .gray
        contentView.addSubview(honorLabel)
        
        strengthLabel.font = UIFont.systemFont(ofSize: 16)
        strengthLabel.textColor = .gray
        contentView.addSubview(strengthLabel)
        
        portraitIamgeView.snp.makeConstraints { (make) in
            make.leading.top.equalTo(10)
            make.bottom.equalTo(-10)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(portraitIamgeView)
            make.leading.equalTo(portraitIamgeView.snp.trailing).offset(10)
        }
        
        honorLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(nameLabel.snp.trailing).offset(10)
            make.centerY.equalTo(nameLabel)
        }
        
        strengthLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(portraitIamgeView)
            make.leading.equalTo(portraitIamgeView.snp.trailing).offset(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public static func akHeight(ofContent object: Any?) -> CGFloat {
        return 44
    }
    
    public func akDrawContent(_ object: BaseMagician?) {
        nameLabel.text = object?.nickname
        honorLabel.text = object?.honor
        strengthLabel.text = object?.strength
    }
}
