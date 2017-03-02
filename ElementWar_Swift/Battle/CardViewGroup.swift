//
//  CardViewGroup.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/28.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit
import EWModel_Swift

class CardViewGroup: NSObject {
    var card: Card? = nil
    var count: UInt = 0
    
    lazy var countLabel = UILabel(frame: .zero) /// 数量标签，width = 44
    
    var baseCardView: CardView? = nil /// 最后移除的卡片视图，width = 88
    private var _activeCardView: CardView? = nil /// 活跃的卡片视图，width = 88
    var activeCardView: CardView? {/// 每次移除的卡片视图，width = 88
        get {
            if let cardView = _activeCardView {
                return cardView
            } else {
                guard let _baseCardView = baseCardView else {
                    return nil
                }
                
                _activeCardView = CardView(card: _baseCardView.card)
                return _activeCardView!
            }
        }
    }
    
    override init() {
        super.init()
        
        countLabel.textColor = .red
        countLabel.font = UIFont.systemFont(ofSize: 18)
        countLabel.text = "0"
    }
}
