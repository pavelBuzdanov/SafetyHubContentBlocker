//
//  ButtonMainView.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 17.02.2021.
//

import UIKit
import SnapKit

class ButtonMainView: UIView {
  
    //MARK: - Subviews
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Filter Database is updated"
        label.font = Fonts.sansRegular.of(size: 15)
        label.textColor = #colorLiteral(red: 0.1333333333, green: 0.1294117647, blue: 0.3568627451, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    
    private let databaseLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Database"
        label.font = Fonts.sansRegular.of(size: 15)
        label.textColor = #colorLiteral(red: 0.1333333333, green: 0.1294117647, blue: 0.3568627451, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Last update at "
        label.font = Fonts.sansRegular.of(size: 11)
        label.textColor = #colorLiteral(red: 0.1333333333, green: 0.1294117647, blue: 0.3568627451, alpha: 0.6)
        label.textAlignment = .left
        return label
    }()
    
    
    private let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "updatedImage")
        return image
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
      let indicator  = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        indicator.color = #colorLiteral(red: 0.2039215686, green: 0.8705882353, blue: 0.8705882353, alpha: 1)
        return indicator
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
    }
    
    
    //MARK: - Setup View
    private func setupView() {
        layoutView()
        startIndicator()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "MMM d, yyyy HH:mm"
        let dateString = df.string(from: date)
        self.dateLabel.text! += dateString
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int.random(in: 3...6))) {
            self.stopIndicator()
        }        
    }
    
    
    //MARK: - Private
    private func startIndicator() {
        [dateLabel, imageView, databaseLabel].forEach({ $0.alpha = 0.0 })
        self.activityIndicator.startAnimating()
    }
    
    private func stopIndicator() {
        [dateLabel, imageView, databaseLabel].forEach({ $0.alpha = 1.0  })
        self.activityIndicator.stopAnimating()
    }
    
    
    //MARK: - Layout View
    private func layoutView() {
        self.addSubview(activityIndicator)
        self.addSubview(descriptionLabel)
        self.addSubview(imageView)
        self.addSubview(databaseLabel)
        self.addSubview(dateLabel)
        
        activityIndicator.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 40, height: 40))
            make.center.equalTo(self.snp.center)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left)
            make.top.equalTo(self.snp.top)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 42, height: 42))
            make.left.equalTo(self.snp.left)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(23)
        }
        
        databaseLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.top).offset(6)
            make.left.equalTo(imageView.snp.right).offset(7)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(databaseLabel.snp.bottom).offset(1)
            make.left.equalTo(imageView.snp.right).offset(7)
        }
        
    }
}
