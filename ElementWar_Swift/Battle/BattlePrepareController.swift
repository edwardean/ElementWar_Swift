//
//  BattlePrepareController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/7.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

///准备战斗页面
import UIKit
import SnapKit
import EWDataCenter_Swift
import EWMessageModel_Swift

class BattlePrepareController: UIViewController, SocketManagerDelegate {
    
    var myPortraitImageView = UIImageView()
    var opponentPortraitImageView = UIImageView() // 对手头像
    var progressLabel = UILabel()
    
    override func viewDidLoad() {
        
        progressLabel.textColor = .white
        progressLabel.text = "等待对方接受邀请..."
        progressLabel.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .horizontal)
        view.addSubview(progressLabel)
        
        ///battleImageView在页面中心位置
        let battleImageView = UIImageView()
        battleImageView.image = nil
        view.addSubview(battleImageView)
        
        myPortraitImageView.image = nil
        view.addSubview(myPortraitImageView)
        
        opponentPortraitImageView.image = nil
        view.addSubview(opponentPortraitImageView)
        
        battleImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        myPortraitImageView.snp.makeConstraints { (make) in
            make.trailing.equalTo(battleImageView.snp.leading).offset(-22)
            make.centerY.equalTo(battleImageView)
        }
        
        opponentPortraitImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(battleImageView.snp.trailing).offset(22)
            make.centerY.equalTo(battleImageView)
        }
        
        progressLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-22)
            make.centerX.equalToSuperview()
        }
        
        EWDataCenter_Swift.SocketManager.manager.addDelegate(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// SocketManagerDelegate，收到消息
    ///
    /// - Parameters:
    ///   - manager: SocketManager
    ///   - container: 收到消息的容器
    public func SocketManager(_ manager: SocketManager, receiveMessage container: Container) {
        switch container.messageType {
        case .inviteReplyNotice:
            handleInviteReplyNotice(container.inviteReplyNotice)
        case .inRoomNotice:
            handleInRoomNotice(container.inRoomNotice)
        default: break
            
        }
    }
    
    /// 处理邀请回复通知
    private func handleInviteReplyNotice(_ notice: InviteReplyNotice) {
        
        let restTime: TimeInterval = notice.expiredTime - Date().timeIntervalSince1970
        
        if restTime <= 0 {
            progressLabel.text = "对方响应超时"
        }
    }
    
    /// 处理进入房间通知
    private func handleInRoomNotice(_ notice: InRoomNotice) {
        let restTime: TimeInterval = notice.expiredTime - Date().timeIntervalSince1970
        
        if restTime <= 0 {
            progressLabel.text = "服务器响应超时"
            return
        }
        
        ///进入房间
        let roomController = RoomController()
        navigationController?.pushViewController(roomController, animated: true)
    }
}
