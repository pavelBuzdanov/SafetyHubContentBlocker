//
//  BlockerCustomView.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 17.02.2021.
//

import UIKit
import SnapKit
import SafariServices

class BlockerCustomView: UIView {
    
    
    //MARK: - Properties
    private var blockerType: BlockerTypeModel
    
    private var blockerBundle: String
    
    private var blockerKey: String
    
    
    
    //MARK: - SubViews
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = Fonts.sansRegular.of(size: 15)
        label.textAlignment = .center
        return label
    }()
    
    private let proImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "proRed")
        return image
    }()
    
    private let customSwitch: CustomUISwitch = {
        let switchUI = CustomUISwitch()
        switchUI.isOn = true
        switchUI.translatesAutoresizingMaskIntoConstraints = false
        switchUI.addTarget(self, action: #selector(customSwitchChange), for: .valueChanged)
        return switchUI
    }()
    
    //MARK: - Constructor
    init(type: BlockerTypeModel, blockerBundle: String, blockerKey: String) {
        
        self.blockerType = type
        self.blockerBundle = blockerBundle
        self.blockerKey = blockerKey
        
        super.init(frame: .zero)
        setupView(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 20
        
        
        layer.shadowOffset = .zero
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.2
    }
    
    
    //MARK: - SetupView
    private func setupView(type: BlockerTypeModel) {
        layoutView()
        
        SFContentBlockerManager.reloadContentBlocker(withIdentifier: blockerBundle, completionHandler: nil)
        
        self.customSwitch.isOn = sharedUserDeafults!.bool(forKey: blockerKey) ? true : false
        
        self.proImageView.isHidden = true
        
        self.backgroundColor = type.backgroundColor
        self.descriptionLabel.text = type.description
        self.descriptionLabel.textColor = type.textColor
        self.imageView.image = type.image
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    //MARK: - Private functions
    @objc func customSwitchChange() {
        
        switch customSwitch.isOn {
         case true : sharedUserDeafults?.set(true, forKey: blockerKey)
         case false : sharedUserDeafults?.set(false, forKey: blockerKey)
        }
        
        SFContentBlockerManager.reloadContentBlocker(withIdentifier: blockerBundle, completionHandler: nil)
    }
    
    
    //MARK: - Layout View
    private func layoutView() {
        self.addSubview(imageView)
        self.addSubview(descriptionLabel)
        self.addSubview(customSwitch)
        self.addSubview(proImageView)
        
        imageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 36, height: 28))
            make.top.equalTo(self.snp.top).offset(16)
            make.left.equalTo(self.snp.left).offset(16)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(16)
            make.right.equalTo(self.snp.right).offset(-16)
            make.top.equalTo(imageView.snp.bottom).offset(20)
        }
        
        customSwitch.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(16)
            make.right.equalTo(self.snp.right).offset(-16)
        }
        
        proImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 40, height: 20))
            make.top.equalTo(self.snp.top).offset(16)
            make.right.equalTo(self.snp.right).offset(-16)
        }
    }
    
    
    
    
}
