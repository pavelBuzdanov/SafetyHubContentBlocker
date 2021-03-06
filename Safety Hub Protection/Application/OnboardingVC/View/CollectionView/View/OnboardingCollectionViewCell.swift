//
//  OnboardingCollectionViewCell.swift
//  Porn Blocker
//
//  Created by  on 13.02.2021.
//

import UIKit
import SnapKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let identifier = "OnboardingCollectionViewCell"
    
    var model: OnBoardingModel? {
        didSet {
            if let model = model {
                mainTextLabel.text = model.mainText
                imageImageView.image = UIImage(named: model.imageViewName)
            }
        }
    }
    
    //MARK: - Subviews
    private let mainTextLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = Fonts.sansBold.of(size: 28)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.numberOfLines = 2
        return label
    }()
    
    private let imageImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    //MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Cell
    private func setupCell() {
        layoutCell()
        
        backgroundColor = .clear
        
    }
    
    //MARK: - Layout
    private func layoutCell() {
        contentView.addSubview(imageImageView)
        contentView.addSubview(mainTextLabel)
        
        imageImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 300, height: 300))
            make.centerX.equalTo(contentView.snp.centerX)
            if DeviceType.iPhone8 || DeviceType.iPhone8Plus || DeviceType.iPhoneSE {
                make.top.equalTo(contentView.snp.top).offset(50)
            } else {
                make.top.equalTo(contentView.snp.top).offset(130)
            }
            
        }
        
        mainTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageImageView.snp.bottom).offset(30)
            make.centerX.equalTo(contentView.snp.centerX)
        }
    }
    
}
