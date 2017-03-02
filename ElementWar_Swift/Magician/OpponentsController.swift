//
//  OpponentsController.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/19.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

/// 对手列表

import UIKit
import EWModel_Swift
import EWDataCenter_Swift

class OpponentsController: UITableViewController {
    var offset: UInt = 0 /// 偏移量
    var pageSize: UInt = 20 /// 单页条数。默认20
    
    var magicians = [BaseMagician]() /// 法师数组
    
    override func viewDidLoad() {
        tableView.register(MagicianCell.self, forCellReuseIdentifier: "MagicianCell")
        requestOpponents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 请求排名
    private func requestOpponents() {
        let service = OpponentService()
        service.offset = offset
        service.pageSize = pageSize
        service.active(Success: { (magicians) in
            //[unowned self]
            self.magicians = magicians
            self.tableView.reloadData()
        }, Failure: { (error) in
            self.view.makeToast(error.alert)
        })
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magicians.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagicianCell") as! MagicianCell
        cell.akDrawContent(magicians[indexPath.row])
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let baseMagician = magicians[indexPath.row]
        
        let magicianDetailController = MagicianDetailController()
        magicianDetailController.magicianID = baseMagician.userID
        self.navigationController?.pushViewController(magicianDetailController, animated: true)
    }
}
