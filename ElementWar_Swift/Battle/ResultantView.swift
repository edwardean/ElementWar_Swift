//
//  ResultantView.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/21.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit
import SnapKit
import EWModel_Swift

class ResultantView: UIScrollView {
    private var container = UIView()
    private var cardViews = [CardView]()
    /// 选择的生成物组合
    private var selectedCards = [String:UInt]()
    
    init(cards: [Card]) {
        super.init(frame: .zero)
        container.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        for card in cards {
            let cardView = CardView(card: card)
            self.container.addSubview(cardView)
            
            cardView.snp.makeConstraints({ (make) in
                if let lastCardView = cardViews.last {
                    make.leading.equalTo(lastCardView.snp.trailing).offset(20)
                } else {
                    make.leading.equalTo(20)
                }
                make.top.equalTo(20)
                make.bottom.equalTo(-20)
            })
            
            cardViews.append(cardView)
        }
        
        if let lastCardView = cardViews.last {
            lastCardView.snp.makeConstraints({ (make) in
                make.trailing.equalTo(-20)
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
