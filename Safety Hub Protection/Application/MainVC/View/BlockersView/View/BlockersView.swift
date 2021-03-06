//
//  BlockersView.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 17.02.2021.
//

import UIKit
import SnapKit

class BlockersView: UIView {
    
    //MARK: - Properties
    
    
    //MARK: - Sub Views
    private let adsBlockerView = BlockerCustomView(type: .adsBlocker,
                                                   blockerBundle: AppConstants.adsBlockerBundle,
                                                   blockerKey: SharedUserDeafults.Keys.adsBlockerState)
    
    private let malwareBlockerView = BlockerCustomView(type: .malwareBlocker,
                                                       blockerBundle: AppConstants.malwareBlockerBundle,
                                                       blockerKey: SharedUserDeafults.Keys.malwareBlockerState)
    
    private let pornBlockerView = BlockerCustomView(type: .pornBlocker,
                                                    blockerBundle: AppConstants.pornBlokerBundle,
                                                    blockerKey: SharedUserDeafults.Keys.pornBlockerState)
    
    private  let trackBlockerView = BlockerCustomView(type: .trackBlocker,
                                                      blockerBundle: AppConstants.trackBlockerBundle,
                                                      blockerKey:  SharedUserDeafults.Keys.trackBlockerState)
    
    
    
    lazy var topStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 19
        stack.distribution = .fillEqually
        [adsBlockerView, malwareBlockerView].forEach({ stack.addArrangedSubview($0)})
        return stack
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 19
        stack.distribution = .fillEqually
        [pornBlockerView, trackBlockerView].forEach({ stack.addArrangedSubview($0)})
        return stack
    }()
    
    
    //MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup View
    private func setupView() {
        layoutView()
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func layoutView() {
        addSubview(topStackView)
        addSubview(buttonStackView)
        
        topStackView.snp.makeConstraints { (make) in
            if DeviceType.iPhone8 || DeviceType.iPhoneSE {
                make.height.equalTo(100)
            } else {
                make.height.equalTo(107)
            }
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
        }
        
        buttonStackView.snp.makeConstraints { (make) in
            if DeviceType.iPhone8 || DeviceType.iPhoneSE {
                make.height.equalTo(100)
                make.top.equalTo(topStackView.snp.bottom).offset(9)
            } else {
                make.height.equalTo(107)
                make.top.equalTo(topStackView.snp.bottom).offset(19)
            }
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            
        }
    }
    
}
