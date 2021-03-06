//
//  HowToCollectionViewCell.swift
//  Porn Blocker
//
//  Created by on 15.02.2021.
//

import UIKit

class HowToCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let identifier = "HowToCollectionViewCell"
    
    var model: HowToModel? {
        didSet {
            if let model = model {
                descriptionLabel.text = model.description
                phoneImageView.image = UIImage(named: model.imageName)
            }
        }
    }
    
    //MARK: - Views
    private let phoneImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        if DeviceType.iPhone8 || DeviceType.iPhoneSE {
            label.font = Fonts.sansBold.of(size: 28)
        } else {
            label.font = Fonts.sansBold.of(size: 20)
        }
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.numberOfLines = 2
        return label
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
        contentView.addSubview(phoneImageView)
        contentView.addSubview(descriptionLabel)
        
        phoneImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView.snp.edges)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.width.equalTo(240)
            make.height.equalTo(56)
            make.centerX.equalTo(contentView.snp.centerX)
            if DeviceType.iPhone8 || DeviceType.iPhoneSE {
                make.top.equalTo(contentView.snp.top).offset(10)
            } else {
                make.top.equalTo(contentView.snp.top).offset(30)
            }
          
        }
    }
    
}
