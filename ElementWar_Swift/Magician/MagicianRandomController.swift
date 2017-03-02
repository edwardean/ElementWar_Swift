//
//  MagicianRandomController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/7.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

///随机挑选开战用户控制器
import UIKit
import EWDataCenter_Swift
import EWMessageModel_Swift

class MagicianRandomController: UIViewController, SocketManagerDelegate {
    
    var myPortraitImageView = UIImageView()
    var opponentPortraitImageView = UIImageView() // 对手头像
    
    override func viewDidLoad() {
        
        ///battleImageView在页面中心位置
        let battleImageView = UIImageView()
        battleImageView.image = nil
        self.view.addSubview(battleImageView)
        
        myPortraitImageView.image = nil
        self.view.addSubview(myPortraitImageView)
        
        opponentPortraitImageView.image = nil
        self.view.addSubview(opponentPortraitImageView)
        
        battleImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        myPortraitImageView.snp.makeConstraints { (make) in
            make.right.equalTo(battleImageView.snp.left).offset(-22)
            make.centerY.equalTo(battleImageView)
        }
        
        opponentPortraitImageView.snp.makeConstraints { (make) in
            make.left.equalTo(battleImageView.snp.right).offset(22)
            make.centerY.equalTo(battleImageView)
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
        case .matchNotice:
            self.handleMatchNotice(container.matchNotice)
        default: break
        }
    }
    
    /// 处理匹配通知
    private func handleMatchNotice(_ notice: MatchNotice) {
        let restTime: TimeInterval = notice.expiredTime - Date().timeIntervalSince1970
        if restTime <= 0 {
            let battlePrepareController = BattlePrepareController()
            self.navigationController?.pushViewController(battlePrepareController, animated: true)
        }
    }

}
