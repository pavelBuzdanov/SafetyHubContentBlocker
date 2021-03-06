//
//  SettingsTableViewCell.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 18.02.2021.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    static let identifier = "SettingsTableViewCell"
    
    
    var option: SettingsOption? {
        didSet {
            if let option = option {
                descriptionLabel.text = option.description
            }
        }
    }
    
    //MARK: - Views
    
    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "line")
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.1058823529, green: 0.1137254902, blue: 0.1568627451, alpha: 1)
        label.font = Fonts.sansRegular.of(size: 18)
        label.textAlignment = .left
        return label
    }()

 
    //MARK: - Constructor
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Setup Cell
    private func setupCell() {
        layoutCell()
        
        selectionStyle = .none
        backgroundColor = .clear
        
    }
    
    
    
    //MARK: - Layout Cell
    private func layoutCell() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(descriptionLabel)
        
        iconImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 24, height: 24))
            make.left.equalTo(contentView.snp.left).offset(30)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-30)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
}
