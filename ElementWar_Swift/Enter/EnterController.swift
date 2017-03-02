//
//  EnterController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/7.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit
import SnapKit
import BlocksKit
import Toast
import AKFoundation
import AKUIKit
import AKError
import AKWeChatManager
import AKModel
import EWModel_Swift
import EWDataCenter_Swift

class EnterController: UIViewController {
    
    lazy var progressLabel = UILabel(frame: .zero)
    lazy var wechatButton = UIButton(type: .custom)
    lazy var qqButton = UIButton(type: .custom)
    lazy var weiboButton = UIButton(type: .custom)
    lazy var progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = AKColorRGB(26, 27, 37)
        
        progressLabel.textColor = .white
        progressLabel.text = "通过微信、QQ或者微博登录"
        progressLabel.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .horizontal)
        self.view.addSubview(progressLabel)
        
        wechatButton.setImage(UIImage(named:"login_wechat"), for: .normal)
        self.view.addSubview(wechatButton)
        
        wechatButton.bk_addEventHandler({ (sender) in
            AKWeChatManager.loginSuccess({ (socialUser) in
                let service = SocialLoginService()
                service.type = .weixin
                service.openID = socialUser.openID
                service.accessToken = socialUser.accessToken
                service.refreshToken = socialUser.refreshToken
                service.expiredTime = socialUser.expiredTime
                service.nickname = socialUser.nickname
                service.mobile = socialUser.mobile
                service.portrait = socialUser.portrait
                service.motto = socialUser.motto
                service.active(Success: { (tmpUser) in
                    let user = Magician.currentUser as! Magician
                    user.loginType = tmpUser.loginType
                    user.openID = tmpUser.openID
                    user.nickname = tmpUser.nickname
                    user.mobile = tmpUser.mobile
                    user.portrait = tmpUser.portrait
                    user.motto = tmpUser.motto
                    
                    let token = AKToken.current
                    token.accessToken = socialUser.accessToken
                    token.refreshToken = socialUser.refreshToken
                    token.expiredTime = socialUser.expiredTime
                    
                    let homeController = HomeController()
                    self.present(homeController, animated: true, completion: {})
                }, Failure: { (error) in
                    self.view.makeToast(error.alert)
                })
            }, failure: { (error) in
                self.view.makeToast(error.localizedDescription)
            })
        }, for: .touchUpInside)
        
        qqButton.setImage(UIImage(named:"login_qq"), for: .normal)
        self.view.addSubview(qqButton)
        
        weiboButton.setImage(UIImage(named:"login_weibo"), for: .normal)
        self.view.addSubview(weiboButton)
        
        progressView.backgroundColor = .white
        progressView.tintColor = AKColorRGB(251, 0, 40)
        self.view.addSubview(progressView)
        
        progressLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        wechatButton.snp.makeConstraints { (make) in
            make.top.greaterThanOrEqualTo(progressLabel.snp.bottom).offset(22).priority(UILayoutPriorityRequired)
            make.bottom.greaterThanOrEqualTo(wechatButton.snp.bottom).offset(-44)
        }
        
        qqButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(wechatButton)
            make.leading.equalTo(wechatButton.snp.trailing).offset(44)
            make.centerX.equalToSuperview()
        }
        
        weiboButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(qqButton)
            make.leading.equalTo(qqButton.snp.trailing).offset(44)
        }
        
        progressView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(14).priority(UILayoutPriorityRequired)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 请求版本信息
    func requestVersion() {
        let versionService = VersionService()
        versionService.active(Success: { (_release, _resource) in
            guard let release = _release else {
                self.enableLoginButton()
                return
            }
            
            guard let latestReleaseVersion = release.latestVersion else {
                self.enableLoginButton()
                return
            }
            
            //如果服务器版本比本地版本大，那么提示下载
            if latestReleaseVersion >= Bundle.ak_info(.releaseVersion) {
                self.alertForBundleVersion()
            } else {
                self.compareResourceVersion(_resource)
            }
            
        }, Failure: { (error: AKError) in
            self.enableLoginButton()
        })
    }
    
    func enableLoginButton() {
        wechatButton.isEnabled = true
        qqButton.isEnabled = true
        weiboButton.isEnabled = true
    }
    
    func alertForBundleVersion() {
        let alertController = UIAlertController(title: "提示", message: "当前游戏有新版本，是否前往下载?", preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: "取消", style: .cancel, handler: { (action) in
            
        })
        alertController.addAction(cancleAction)
        let downloadAction = UIAlertAction(title: "去下载", style: .default, handler: { (action) in
            
        })
        alertController.addAction(downloadAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func compareResourceVersion(_ _resource: Version?) {
        guard let resource = _resource else {
            self.enableLoginButton()
            return
        }
        
        guard let latestResouceVersion = resource.latestVersion else {
            self.enableLoginButton()
            return
        }
        
        guard let url = resource.url else {
            self.enableLoginButton()
            return
        }
        
        guard let resourceVersion = AKUserDefaultsObjectForKey("resourceVersion") as? String else {
            self.downloadResource(version: latestResouceVersion, url: url)
            return
        }
        
        if latestResouceVersion >= resourceVersion {
            self.downloadResource(version: latestResouceVersion, url: url)
        }
    }
    
    func downloadResource(version: String, url: String) {
        self.enableLoginButton()
        AKUserDefaultsSetObjectForKey(version, "resourceVersion")
    }
}
