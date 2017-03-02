//
//  ConditionView.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/21.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

import UIKit
import SnapKit
import BlocksKit
import EWModel_Swift

class ConditionView: UIScrollView {
    
    weak var conditionDelegate: ConditionViewDelegate? = nil
    private var conditionSegmentedControl = UISegmentedControl(frame: .zero)
    
    convenience init(images: [UIImage]) {
        self.init(frame: .zero)
        
        for index in 0...images.count {
            conditionSegmentedControl.insertSegment(with: images[index], at: index, animated: false)
        }
        conditionSegmentedControl.isMomentary = false
        weak var weak_self = self
        conditionSegmentedControl.bk_addEventHandler({ (_segmentedControl) in
            let strong_self = weak_self
            guard let delegate = strong_self?.conditionDelegate else {
                return
            }
            
            let segmentedControl = _segmentedControl as! UISegmentedControl
            delegate.ConditionView(conditionView: strong_self!, SelectIndex: UInt(segmentedControl.selectedSegmentIndex))
        }, for: .touchUpInside)
        self.addSubview(conditionSegmentedControl)
        
        conditionSegmentedControl.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol ConditionViewDelegate: NSObjectProtocol {
    func ConditionView(conditionView: ConditionView, SelectIndex index:UInt) -> Void
}
