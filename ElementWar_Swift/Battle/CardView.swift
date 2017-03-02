//
//  CardView.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 2017/2/17.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

/// 卡牌视图
import UIKit
import SnapKit
import Kingfisher
import EWModel_Swift

class CardView: UIView, UIGestureRecognizerDelegate {
    
    let card: Card
    weak var delegate: CardViewDelegate? = nil
    
    private let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressOnSelf))
    private let pan = UIPanGestureRecognizer(target: self, action: #selector(panOnSelf))
    private var origin: CGPoint? = nil
    
    /// 化学式Label（左上1）
    private let nameLabel = UILabel(frame: .zero)
    
    /// 中文名Label（左上2）
    private let cnameLabel = UILabel(frame: .zero)
    
    /// 效果Label数组（左下）
    private var effectLabels = [UILabel]()
    
    /// 简述Label（右下）
    private let witticismLabel = UILabel(frame: .zero)
    
    /// 2D模型视图（中间）
    private let dim2View = UIImageView(frame: .zero)
    
    init(card: Card) {
        self.card = card
        super.init(frame: .zero)
        pan.delegate = self
        
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.textColor = .red
        nameLabel.text = card.element?.name
        self.addSubview(nameLabel)
        
        cnameLabel.font = UIFont.systemFont(ofSize: 14)
        cnameLabel.textColor = .red
        cnameLabel.text = card.element?.cname
        self.addSubview(cnameLabel)
        
        if let effects = card.effects {
            for effect in effects {
                let effectLabel = UILabel(frame: .zero)
                effectLabel.font = UIFont.systemFont(ofSize: 14)
                effectLabel.textColor = .red
                effectLabel.text = effect.detail
                self.addSubview(effectLabel)
                effectLabels.append(effectLabel)
            }
        }
        
        witticismLabel.font = UIFont.systemFont(ofSize: 14)
        witticismLabel.textColor = .red
        witticismLabel.text = card.element?.cname
        self.addSubview(witticismLabel)
        
        dim2View.kf.setImage(with: URL(string: card.element!.dim2!))
        self.addSubview(dim2View)
        
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.top.equalTo(10)
        }
        
        cnameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(nameLabel.snp.trailing)
            make.centerY.equalTo(nameLabel)
        }
        
        var lastEffectLabel: UILabel? = nil
        for effectLabel in effectLabels {
            effectLabel.snp.makeConstraints({ (make) in
                if let _lastEffectLabel = lastEffectLabel {
                    make.leading.equalTo(_lastEffectLabel)
                    make.bottom.equalTo(_lastEffectLabel.snp.top).offset(-10)
                } else {
                    make.leading.equalTo(10)
                    make.bottom.equalTo(-10)
                }
            })
            lastEffectLabel = effectLabel
        }
        
        witticismLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(-10)
            make.bottom.equalTo(-10)
        }
        
        dim2View.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func longPressOnSelf(recognizer: UILongPressGestureRecognizer) {
        switch recognizer.state {
        case .began:
            let keyWindow = UIApplication.shared.keyWindow
            let frame = self.convert(self.frame, to: keyWindow)
            keyWindow?.addSubview(self)
            self.frame = frame
            
            origin = self.frame.origin
        default: break
        }
    }
    
    func panOnSelf(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            let point = pan.translation(in: self.superview)
            var frame = self.frame
            frame.origin.x = self.origin!.x + point.x
            frame.origin.y = self.origin!.y + point.y
            self.frame = frame
        case .ended:
            origin = nil
            delegate?.CardView(self, didFinishPanGesture: recognizer)
        case .cancelled, .failed:
            origin = nil
            delegate?.CardView(self, didFinishPanGesture: recognizer)
        default: break
        }
    }
}

protocol CardViewDelegate: NSObjectProtocol {
    func CardView(_ cardView: CardView, didFinishPanGesture recognizer: UIPanGestureRecognizer)
}
