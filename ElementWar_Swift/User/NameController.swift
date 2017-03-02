//
//  NameController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/7.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit
import SnapKit

class NameController: UIViewController {
    
    //视图容器，用于当键盘弹出的时候随着键盘一起上滑
    private var container: UIView? = nil
    private var nameTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .black
        
        /********************************************************************/
        
        let container = UIView()
        container.backgroundColor = .gray
        self.view.addSubview(container)
        
        container.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.center.equalToSuperview()
        }
        
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .white
        nameLabel.text = "Bloody Lucifer"
        container.addSubview(nameLabel)
        
        let newNameGuideLabel = UILabel()
        newNameGuideLabel.backgroundColor = .orange
        newNameGuideLabel.textColor = .white
        newNameGuideLabel.text = "新的称呼："
        container.addSubview(newNameGuideLabel)
        
        nameTextField.font = UIFont.systemFont(ofSize: 16)
        nameTextField.textColor = .white
        nameTextField.placeholder = "伟大魔法师的名字从来不超过20个字符"
        container.addSubview(nameTextField)
        
        let confirmButton = UIButton(type: .custom)
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.setTitle("确定", for: .normal)
        container.addSubview(confirmButton)
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        newNameGuideLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(22)
            make.trailing.equalTo(nameLabel.snp.leading)
        }
        
        nameTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(newNameGuideLabel.snp.trailing)
            make.centerY.equalTo(newNameGuideLabel)
            make.width.equalTo(132)
            make.height.equalTo(34)
        }
        
        confirmButton.snp.makeConstraints { (make) in
            make.top.equalTo(nameTextField.snp.bottom).offset(22)
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
