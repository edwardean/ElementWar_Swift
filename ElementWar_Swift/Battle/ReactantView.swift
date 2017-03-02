//
//  ReactantView.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/21.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit

class ReactantView: UIScrollView {
    
    private let container = UIView()
    private var cardViewGroups = [ReactantCardViewGroup]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        container.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 添加视图
    ///
    /// - Parameter cardView: 要被添加到反应物视图的卡片视图
    func addCardView(_ cardView: CardView) {
        guard let targetCardID = cardView.card.cardID else {
            return
        }
        
        var cardViewGroup: ReactantCardViewGroup? = nil
        
        cardViewGroups.enumerated().forEach { (index: Int, group: ReactantCardViewGroup) in
            if group.card?.cardID == targetCardID {
                cardViewGroup = group
            }
        }

        if cardViewGroup == nil {
            cardViewGroup = ReactantCardViewGroup()
            cardViewGroup?.baseCardView = cardView
            
            /// 如果之前已经有group，那么需要添加➕视图和数量标签
            if cardViewGroups.count > 0 {
                self.container.addSubview(cardViewGroup!.plusMarkImageView)
                self.container.addSubview(cardViewGroup!.countLabel)
                self.container.addSubview(cardViewGroup!.baseCardView!)
                
                cardViewGroup!.plusMarkImageView.snp.makeConstraints({ (make) in
                    make.leading.equalTo(cardViewGroups.last!.baseCardView!.snp.trailing)
                    make.width.equalTo(44)
                    make.centerY.equalToSuperview()
                })
                
                cardViewGroup!.countLabel.snp.makeConstraints({ (make) in
                    make.leading.equalTo(cardViewGroup!.plusMarkImageView.snp.trailing)
                    make.width.equalTo(44)
                    make.centerY.equalToSuperview()
                })
                
                cardViewGroup!.baseCardView!.snp.makeConstraints({ (make) in
                    make.leading.equalTo(cardViewGroup!.countLabel.snp.trailing)
                    make.width.equalTo(88)
                    make.centerY.equalToSuperview()
                })
            } else {
                self.container.addSubview(cardViewGroup!.baseCardView!)
                
                cardViewGroup!.baseCardView!.snp.makeConstraints({ (make) in
                    make.leading.equalTo(20)
                    make.width.equalTo(88)
                    make.centerY.equalToSuperview()
                })
            }
        } else {
            self.container.addSubview(cardView)
            
            cardView.snp.makeConstraints({ (make) in
                make.center.equalTo(cardViewGroup!.baseCardView!)
            })
        }
        
        cardViewGroups.append(cardViewGroup!)
    }
    
    /// 移除视图
    ///
    /// - Parameter group: 要移除的卡片视图的卡片视图组
    func removeCardView(fromGroup group: CardViewGroup) {
        
    }
}
