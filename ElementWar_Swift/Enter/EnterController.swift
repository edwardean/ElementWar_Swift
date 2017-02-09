//
//  EnterController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/7.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit
import SnapKit

class EnterController: UIViewController {
    
    var progressView: UIProgressView? = nil
    var timer: Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .black
        
        let backgroundImage = UIImage(named: "")
        let backgroundImageView = UIImageView(image: backgroundImage)
        self.view.addSubview(backgroundImageView)
        
        let progressLabel = UILabel()
        progressLabel.textColor = .white
        progressLabel.text = "正在进入游戏"
        progressLabel.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .horizontal)
        self.view.addSubview(progressLabel)
        
        let progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.default)
        progressView.backgroundColor = .gray
        progressView.tintColor = .blue
        self.view.addSubview(progressView)
        self.progressView = progressView
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        progressLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        progressView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
        }
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    func timerRun() {
        if (self.progressView?.progress)! < Float(1) {
            self.progressView?.progress += 0.1
        } else {
            self.timer?.invalidate()
            self.timer = nil
            
            let homeController = HomeController()
            self.present(homeController, animated: true, completion: {})
        }
    }
}
