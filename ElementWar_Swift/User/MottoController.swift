//
//  MottoController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/7.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit
import SnapKit
import EWModel_Swift

class MottoController: UIViewController {
    
    //视图容器，用于当键盘弹出的时候随着键盘一起上滑
    var container: UIView? = nil
    var mottoTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .black
        
        /********************************************************************/
        
        let container = UIView()
        container.backgroundColor = .gray
        self.view.addSubview(container)
        
        container.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(0)
            make.center.equalToSuperview()
        }
        
        let user = Magician.currentUser as! Magician
        
        mottoTextView.font = UIFont.systemFont(ofSize: 16)
        mottoTextView.textColor = .white
        mottoTextView.text = user.motto
        container.addSubview(mottoTextView)
        
        let confirmButton = UIButton(type: .custom)
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.setTitle("确定", for: .normal)
        container.addSubview(confirmButton)
        
        mottoTextView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(176)
            make.height.equalTo(88)
        }
        
        confirmButton.snp.makeConstraints { (make) in
            make.top.equalTo(mottoTextView.snp.bottom).offset(22)
            make.centerX.equalToSuperview()
            make.height.equalTo(44)
            make.bottom.equalToSuperview()
        }
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
}
