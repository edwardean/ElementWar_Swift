//
//  MyProbabilityView.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/19.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit

class MyProbabilityView: UIView {
    
    var winPerLabel = UILabel() //winPercent
    var manSynPerLabel = UILabel() //manSynthesisPercent
    var autoSynPerLabel = UILabel() //autoSynthesisPercent
    var rankLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        winPerLabel.font = UIFont.systemFont(ofSize: 14)
        winPerLabel.textColor = .white
        winPerLabel.text = "98.56%"
        self.addSubview(winPerLabel)
        
        manSynPerLabel.font = UIFont.systemFont(ofSize: 14)
        manSynPerLabel.textColor = .white
        manSynPerLabel.text = "77.12%"
        self.addSubview(manSynPerLabel)
        
        autoSynPerLabel.font = UIFont.systemFont(ofSize: 14)
        autoSynPerLabel.textColor = .white
        autoSynPerLabel.text = "18.45%"
        self.addSubview(autoSynPerLabel)
        
        rankLabel.font = UIFont.systemFont(ofSize: 14)
        rankLabel.textColor = .white
        rankLabel.text = "1486"
        self.addSubview(rankLabel)
        
        winPerLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.leading.equalTo(22)
        }
        
        manSynPerLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.leading.equalTo(winPerLabel.snp.trailing).offset(10)
            make.width.equalTo(winPerLabel)
        }
        
        autoSynPerLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.leading.equalTo(manSynPerLabel.snp.trailing)
            make.width.equalTo(manSynPerLabel)
        }
        
        rankLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.leading.equalTo(autoSynPerLabel.snp.trailing).offset(10)
            make.trailing.equalTo(22)
            make.width.equalTo(autoSynPerLabel)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
