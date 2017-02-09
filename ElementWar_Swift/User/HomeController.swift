//
//  HomeController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/7.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit
import SnapKit

class HomeController: UIViewController {
    
    var nameLabel: UILabel? = nil
    var portraitImageView: UIImageView? = nil
    var honorLabel: UILabel? = nil
    var mottoLabel: UILabel? = nil
    
    var winPerLabel: UILabel? = nil //winPercent
    var manSynPerLabel: UILabel? = nil //manSynthesisPercent
    var autoSynPerLabel: UILabel? = nil //autoSynthesisPercent
    var rankLabel: UILabel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .black
        
        /********************************************************************/
        
        let userContainer = UIView()
        userContainer.backgroundColor = .gray
        self.view.addSubview(userContainer)
        
        userContainer.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(0)
            make.width.equalToSuperview().dividedBy(3)
        }
        
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .white
        nameLabel.text = "Bloody Lucifer"
        userContainer.addSubview(nameLabel)
        self.nameLabel = nameLabel
        
        let portraitImage = UIImage(named: "")
        let portraitImageView = UIImageView(image: portraitImage)
        portraitImageView.backgroundColor = .red
        userContainer.addSubview(portraitImageView)
        self.portraitImageView = portraitImageView
        
        let honorLabel = UILabel()
        honorLabel.backgroundColor = .orange
        honorLabel.textColor = .white
        honorLabel.text = "战神"
        userContainer.addSubview(honorLabel)
        self.honorLabel = honorLabel
        
        let mottoLabel = UILabel()
        mottoLabel.textColor = .white
        mottoLabel.text = "可怜的虫子们啊，都嚎叫着粉碎在我愤怒的火焰中吧！"
        userContainer.addSubview(mottoLabel)
        self.mottoLabel = mottoLabel
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(44)
        }
        
        portraitImageView.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(portraitImageView.snp.width)
        }
        
        honorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(portraitImageView.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(44)
        }
        
        mottoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(honorLabel.snp.bottom)
            make.left.right.bottom.equalTo(0)
        }
        
        /********************************************************************/
        
        let actionContainer = UIView()
        actionContainer.backgroundColor = .magenta
        self.view.addSubview(actionContainer)
        
        actionContainer.snp.makeConstraints { (make) in
            make.top.equalTo(44)
            make.left.equalTo(userContainer.snp.right)
            make.right.equalTo(0)
        }
        
        let battleButton = UIButton(type: .custom)
        battleButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        battleButton.setTitleColor(.white, for: .normal)
        battleButton.setTitle("战斗", for: .normal)
        actionContainer.addSubview(battleButton)
        
        let rankButton = UIButton(type: .custom)
        rankButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rankButton.setTitleColor(.white, for: .normal)
        rankButton.setTitle("伟大的法师们", for: .normal)
        actionContainer.addSubview(rankButton)
        
        let elementButton = UIButton(type: .custom)
        elementButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        elementButton.setTitleColor(.white, for: .normal)
        elementButton.setTitle("元素之书", for: .normal)
        actionContainer.addSubview(elementButton)
        
        let scrollButton = UIButton(type: .custom)
        scrollButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        scrollButton.setTitleColor(.white, for: .normal)
        scrollButton.setTitle("魔法卷轴", for: .normal)
        actionContainer.addSubview(scrollButton)
        
        let epicButton = UIButton(type: .custom)
        epicButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        epicButton.setTitleColor(.white, for: .normal)
        epicButton.setTitle("史诗", for: .normal)
        actionContainer.addSubview(epicButton)
        
        battleButton.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(44)
        }
        
        rankButton.snp.makeConstraints { (make) in
            make.top.equalTo(battleButton.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(44)
        }
        
        elementButton.snp.makeConstraints { (make) in
            make.top.equalTo(rankButton.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(44)
        }
        
        scrollButton.snp.makeConstraints { (make) in
            make.top.equalTo(elementButton.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(44)
        }
        
        epicButton.snp.makeConstraints { (make) in
            make.top.equalTo(scrollButton.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(44)
        }
        
        /********************************************************************/
        
        let probabilityContainer = UIView()
        probabilityContainer.backgroundColor = .purple
        self.view.addSubview(probabilityContainer)
        
        probabilityContainer.snp.makeConstraints { (make) in
            make.top.equalTo(actionContainer.snp.bottom)
            make.left.equalTo(userContainer.snp.right)
            make.right.bottom.equalTo(0)
            make.height.equalTo(50)
        }
        
        let winPerLabel = UILabel()
        winPerLabel.font = UIFont.systemFont(ofSize: 14)
        winPerLabel.textColor = .white
        winPerLabel.text = "98.56%"
        probabilityContainer.addSubview(winPerLabel)
        self.winPerLabel = winPerLabel
        
        let manSynPerLabel = UILabel()
        manSynPerLabel.font = UIFont.systemFont(ofSize: 14)
        manSynPerLabel.textColor = .white
        manSynPerLabel.text = "77.12%"
        probabilityContainer.addSubview(manSynPerLabel)
        self.manSynPerLabel = manSynPerLabel
        
        let autoSynPerLabel = UILabel()
        autoSynPerLabel.font = UIFont.systemFont(ofSize: 14)
        autoSynPerLabel.textColor = .white
        autoSynPerLabel.text = "18.45%"
        probabilityContainer.addSubview(autoSynPerLabel)
        self.autoSynPerLabel = autoSynPerLabel
        
        let rankLabel = UILabel()
        rankLabel.font = UIFont.systemFont(ofSize: 14)
        rankLabel.textColor = .white
        rankLabel.text = "1486"
        probabilityContainer.addSubview(rankLabel)
        self.rankLabel = rankLabel
        
        winPerLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(22)
        }
        
        manSynPerLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(winPerLabel.snp.right).offset(10)
            make.width.equalTo(winPerLabel)
        }
        
        autoSynPerLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(manSynPerLabel.snp.right)
            make.width.equalTo(manSynPerLabel)
        }
        
        rankLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(autoSynPerLabel.snp.right).offset(10)
            make.right.equalTo(22)
            make.width.equalTo(autoSynPerLabel)
        }
        
        /********************************************************************/
        
        let settingButton = UIButton(type: .custom)
        settingButton.clipsToBounds = true
        settingButton.layer.cornerRadius = 33
        settingButton.backgroundColor = .cyan
        settingButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        settingButton.setTitleColor(.white, for: .normal)
        settingButton.setTitle("设置", for: .normal)
        self.view.addSubview(settingButton)
        
        settingButton.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(-10)
            make.width.height.equalTo(66)
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
