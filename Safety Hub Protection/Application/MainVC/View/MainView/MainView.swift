//
//  MainView.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 17.02.2021.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    //MARK: - Views
    private let activatedView = ActivatedView()
    private let blockersView = BlockersView()
    private let buttonView = ButtonMainView ()
    
    private let premiumButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ENABLE ALL PROTECTION", for: .normal)
        button.titleLabel?.font = Fonts.sansBold.of(size: 20)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.8705882353, blue: 0.8705882353, alpha: 1)
        button.addTarget(self, action: #selector(premiumButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.premiumButton.layer.cornerRadius = 20
        
        self.premiumButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.premiumButton.layer.shadowOpacity = 0.25
        self.premiumButton.layer.shadowOffset = .zero
        self.premiumButton.layer.shadowRadius = 10
        
    }
    
    
    //MARK: - SetupView
    private func setupView() {
        layoutView()
        
        
        self.premiumButton.isHidden = true
        
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
    }
    
    
    //MARK: - Private functionc
    @objc private func premiumButtonTapped() {
        Animator.scaleAnimation(view: premiumButton, duration: 1.0, delay: 0.0, options: .curveEaseOut, scaleX: 0.95, scaleY: 0.95, complition: { _ in
            
        }).handler()
    }
    
    
    
    //MARK: - Layout 
    private func layoutView() {
        self.addSubview(activatedView)
        self.addSubview(blockersView)
        self.addSubview(premiumButton)
        self.addSubview(buttonView)
        
        activatedView.snp.makeConstraints { (make) in
            if DeviceType.iPhone8 || DeviceType.iPhoneSE {
                make.height.equalTo(180)
            } else {
                make.height.equalTo(210)
            }
            make.top.equalTo(self.snp.top).offset(5)
            make.left.equalTo(self.snp.left).offset(30)
            make.right.equalTo(self.snp.right).offset(-30)
        }
        
        premiumButton.snp.makeConstraints { (make) in
            make.height.equalTo(60)
            make.top.equalTo(activatedView.snp.bottom).offset(19)
            make.left.equalTo(self.snp.left).offset(30)
            make.right.equalTo(self.snp.right).offset(-30)
        }
        
        blockersView.snp.makeConstraints { (make) in
            if DeviceType.iPhone8 || DeviceType.iPhoneSE {
                make.height.equalTo(185)
            } else {
                make.height.equalTo(233)
            }
            make.top.equalTo(premiumButton.snp.bottom).offset(19)
            make.left.equalTo(self.snp.left).offset(30)
            make.right.equalTo(self.snp.right).offset(-30)
        }
        
        buttonView.snp.makeConstraints { (make) in
            make.height.equalTo(84)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            make.left.equalTo(self.snp.left).offset(30)
            make.right.equalTo(self.snp.right).offset(-30)
        }
        
    }
    
}
