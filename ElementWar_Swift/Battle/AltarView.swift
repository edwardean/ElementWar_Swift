//
//  AltarView.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/18.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

/// 祭坛。游戏中用于组合化学反应的视图

import UIKit
import SnapKit
import EWModel_Swift

class AltarView: UIView {
    
    private let reactantView = ReactantView() /// 反应物视图
    private let conditionView = ConditionView()
    //private let resultantView = ResultantView(frame: .zero) /// 生成物视图
    private let autoSynButton = UIButton() /// 自动反应按钮
    
    let cards = [Card]() /// 卡牌数组
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(reactantView)
        
        autoSynButton.clipsToBounds = true
        autoSynButton.layer.cornerRadius = 33
        autoSynButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        autoSynButton.setTitleColor(.gray, for: .normal)
        autoSynButton.setTitle("自动炼金", for: .normal)
        self.addSubview(autoSynButton)
        
        self.addSubview(conditionView)
        //self.addSubview(resultantView)
        
        reactantView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(132)
            make.leading.equalTo(88)
            make.trailing.equalTo(-88)
        }
        
        autoSynButton.snp.makeConstraints { (make) in
            make.leading.equalTo(reactantView.snp.trailing).offset(22)
            make.width.height.equalTo(66)
            make.centerY.equalTo(reactantView)
        }
        
        conditionView.snp.makeConstraints { (make) in
            make.top.equalTo(reactantView.snp.bottom)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(66)
        }
        
//        resultantView.snp.makeConstraints { (make) in
//            make.top.equalTo(conditionView.snp.bottom)
//            make.height.equalTo(132)
//            make.bottom.equalToSuperview()
//            make.leading.equalTo(88)
//            make.trailing.equalTo(-88)
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
