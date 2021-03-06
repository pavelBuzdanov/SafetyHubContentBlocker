//
//  ActivatedView.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 17.02.2021.
//

import UIKit
import SnapKit
import SafariServices

class ActivatedView: UIView {
    
    //MARK: - Properties
    var state: ActivatedViewState? {
        didSet {
            if let state = state {
                self.backgroundColor = state.backgroundColor
                self.imageView.setImage(state.image, duration: 0.5)
                self.descriptionLabel.setText(state.description, duration: 0.5)
            }
        }
    }
    
    
    //MARK: - Views
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let proImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "pro")
        return image
    }()
    
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = Fonts.sansBold.of(size: 16)
        label.textAlignment = .center
        return label
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
        
        self.layer.cornerRadius = 20
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        
    }
    
    
    //MARK: - Setup View
    private func setupView() {
        layoutView()
        
        self.state = sharedUserDeafults!.bool(forKey: SharedUserDeafults.Keys.activatedViewState) ? .active : .inactive
    
        self.proImageView.isHidden = false
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(activteViewTapped))
        self.addGestureRecognizer(tapGestureRecognizer)
        
        
      
    }
    
    
    //MARK: - Functions
    @objc private func activteViewTapped() {
        Animator.scaleAnimation(view: self, duration: 1.0, delay: 0.0, options: .curveEaseOut, scaleX: 0.95, scaleY: 0.95).handler()
        
        [
            AppConstants.adsBlockerBundle,
            AppConstants.malwareBlockerBundle,
            AppConstants.pornBlokerBundle,
            AppConstants.trackBlockerBundle,
            
        ].forEach( { SFContentBlockerManager.reloadContentBlocker(withIdentifier: $0, completionHandler: nil)})
        
        guard let state = self.state else { return }
        
        if state == .inactive {
            sharedUserDeafults!.set(true, forKey: SharedUserDeafults.Keys.activatedViewState)
            self.state = .active
        } else {
            sharedUserDeafults!.set(false, forKey: SharedUserDeafults.Keys.activatedViewState)
            self.state = .inactive
        }
        
    }
    
    
    
    //MARK: - Layout View
    private func layoutView() {
        self.addSubview(proImageView)
        self.addSubview(imageView)
        self.addSubview(descriptionLabel)
        
        proImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 40, height: 20))
            make.top.equalTo(self.snp.top).offset(20)
            make.right.equalTo(self.snp.right).offset(-20)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 130, height: 130))
            make.top.equalTo(self.snp.top).offset(20)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(7)
            make.left.equalTo(self.snp.left).offset(32)
            make.right.equalTo(self.snp.right).offset(-32)
        }
    }
    
}
