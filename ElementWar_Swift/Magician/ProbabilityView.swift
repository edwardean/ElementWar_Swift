//
//  ProbabilityView.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/19.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit

class ProbabilityView: UIView {
    var winPerLabel = UILabel() //winPercent
    var manSynPerLabel = UILabel() //manSynthesisPercent
    var autoSynPerLabel = UILabel() //autoSynthesisPercent
    var rankLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        let centerView = UIView()
        self.addSubview(centerView)
        
        let winPerGuideLabel = UILabel()
        winPerGuideLabel.font = UIFont.systemFont(ofSize: 14)
        winPerGuideLabel.textColor = .white
        winPerGuideLabel.text = "胜率："
        self.addSubview(winPerGuideLabel)
        
        winPerLabel.font = UIFont.systemFont(ofSize: 14)
        winPerLabel.textColor = .white
        winPerLabel.text = "98.56%"
        self.addSubview(winPerLabel)
        
        let manSynPerGuideLabel = UILabel()
        manSynPerGuideLabel.font = UIFont.systemFont(ofSize: 14)
        manSynPerGuideLabel.textColor = .white
        manSynPerGuideLabel.text = "手动合成率："
        self.addSubview(manSynPerGuideLabel)
        
        manSynPerLabel.font = UIFont.systemFont(ofSize: 14)
        manSynPerLabel.textColor = .white
        manSynPerLabel.text = "77.12%"
        self.addSubview(manSynPerLabel)
        
        let autoSynPerGuideLabel = UILabel()
        autoSynPerGuideLabel.font = UIFont.systemFont(ofSize: 14)
        autoSynPerGuideLabel.textColor = .white
        autoSynPerGuideLabel.text = "自动合成率："
        self.addSubview(autoSynPerGuideLabel)
        
        autoSynPerLabel.font = UIFont.systemFont(ofSize: 14)
        autoSynPerLabel.textColor = .white
        autoSynPerLabel.text = "18.45%"
        self.addSubview(autoSynPerLabel)
        
        let rankGuideLabel = UILabel()
        rankGuideLabel.font = UIFont.systemFont(ofSize: 14)
        rankGuideLabel.textColor = .white
        rankGuideLabel.text = "排名："
        self.addSubview(rankGuideLabel)
        
        rankLabel.font = UIFont.systemFont(ofSize: 14)
        rankLabel.textColor = .white
        rankLabel.text = "1486"
        self.addSubview(rankLabel)
        
        centerView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(0)
            make.centerX.equalToSuperview()
        }
        
        winPerGuideLabel.snp.makeConstraints { (make) in
            make.top.equalTo(44)
            make.height.equalTo(44)
            make.trailing.equalTo(centerView.snp.leading)
        }
        
        winPerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(44)
            make.height.equalTo(44)
            make.leading.equalTo(centerView.snp.trailing)
        }
        
        manSynPerGuideLabel.snp.makeConstraints { (make) in
            make.top.equalTo(winPerGuideLabel.snp.bottom)
            make.height.equalTo(44)
            make.trailing.equalTo(centerView.snp.leading)
        }
        
        manSynPerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(winPerLabel.snp.bottom)
            make.height.equalTo(44)
            make.leading.equalTo(centerView.snp.trailing)
        }
        
        autoSynPerGuideLabel.snp.makeConstraints { (make) in
            make.top.equalTo(manSynPerGuideLabel.snp.bottom)
            make.height.equalTo(44)
            make.trailing.equalTo(centerView.snp.leading)
        }
        
        autoSynPerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(manSynPerLabel.snp.bottom)
            make.height.equalTo(44)
            make.leading.equalTo(centerView.snp.trailing)
        }
        
        rankGuideLabel.snp.makeConstraints { (make) in
            make.top.equalTo(autoSynPerGuideLabel.snp.bottom)
            make.height.equalTo(44)
            make.trailing.equalTo(centerView.snp.leading)
        }
        
        rankLabel.snp.makeConstraints { (make) in
            make.top.equalTo(autoSynPerLabel.snp.bottom)
            make.height.equalTo(44)
            make.leading.equalTo(centerView.snp.trailing)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
