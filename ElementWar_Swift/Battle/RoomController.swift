//
//  RoomController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/7.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit
import SnapKit
import EWDataCenter_Swift
import EWMessageModel_Swift
import EWModel_Swift

class RoomController: UIViewController, SocketManagerDelegate {
    
    var cardHeapView = CardHeapView() /// 牌堆视图
    var opponentPortraitImageView = UIImageView() /// 对手头像
    var myPortraitImageView = UIImageView() /// 我的头像
    var workbenchView = WorkbenchView() /// 工作台视图
    var altarView = AltarView() /// 祭坛视图
    var stateLabel = UILabel() /// 状态标签
    
    override func viewDidLoad() {
        view.addSubview(cardHeapView)
        view.addSubview(myPortraitImageView)
        view.addSubview(opponentPortraitImageView)
        view.addSubview(workbenchView)
        view.addSubview(altarView)
        view.addSubview(stateLabel)
        
        cardHeapView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        opponentPortraitImageView.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview()
        }
        
        myPortraitImageView.snp.makeConstraints { (make) in
            make.bottom.left.equalToSuperview()
        }
        
        workbenchView.snp.makeConstraints { (make) in
            make.bottom.right.equalToSuperview()
            make.left.equalTo(myPortraitImageView.snp.right)
        }
        
        altarView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        stateLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        EWDataCenter_Swift.SocketManager.manager.addDelegate(self)
    }
    
    /// SocketManagerDelegate，收到消息
    ///
    /// - Parameters:
    ///   - manager: SocketManager
    ///   - container: 收到消息的容器
    public func SocketManager(_ manager: SocketManager, receiveMessage container: Container) {
        switch container.messageType {
        case .dealNotice:
            handleDealNotice(container.dealNotice)
        case .useCardNotice:
            handleUseCardNotice(container.useCardNotice)
        case .useScrollNotice:
            handleUseScrollNotice(container.useScrollNotice)
        case .playSwitchNotice:
            handlePlaySwitchNotice(container.playSwitchNotice)
        case .finishNotice:
            handleFinishNotice(container.finishNotice)
        default: break
            
        }
    }
    
    /// 处理发牌通知
    /// 无论发牌的通知是否超时，都应该执行发牌
    private func handleDealNotice(_ notice: DealNotice) {
        let restTime: TimeInterval = notice.expiredTime - Date().timeIntervalSince1970
        if restTime <= 0 {
            //TODO:发牌动画
        }
    }
    
    /// 处理出卡通知
    private func handleUseCardNotice(_ notice: UseCardNotice) {
        let restTime: TimeInterval = notice.expiredTime - Date().timeIntervalSince1970
        if restTime > 0 {
            //TODO:如果剩余时间>0，那么就执行出牌效果动画
        }
        
        //TODO:修改血量等状态
    }
    
    /// 处理使用卷轴通知
    private func handleUseScrollNotice(_ notice: UseScrollNotice) {
        let restTime: TimeInterval = notice.expiredTime - Date().timeIntervalSince1970
        if restTime > 0 {
            //TODO:如果剩余时间>0，那么就执行出牌效果动画
        }
        
        //TODO:修改血量等状态
    }
    
    /// 处理出牌方切换通知
    private func handlePlaySwitchNotice(_ notice: PlaySwitchNotice) {
        if notice.playerId == Magician.currentUser.openID {
            //如果切换到自己出牌
            let restTime: TimeInterval = notice.expiredTime - Date().timeIntervalSince1970
            if restTime > 0 {
                //TODO:如果剩余时间>0，那么就是自己出牌，开始倒计时
            } else {
                stateLabel.text = "错过出手机会"
            }
        } else {
            //TODO:如果是其他人出牌，那么显式出牌切换动画
        }
    }
    
    /// 处理结束通知
    private func handleFinishNotice(_ notice: FinishNotice) {
        if notice.winnerId == Magician.currentUser.openID {
            //TODO:获胜
        } else {
            //TODO:失败
        }
        
        navigationController?.popViewController(animated: true)
    }
}
