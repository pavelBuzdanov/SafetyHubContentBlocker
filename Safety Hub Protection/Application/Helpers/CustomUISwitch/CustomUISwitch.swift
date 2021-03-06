//
//  CustomUISwitch.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 17.02.2021.
//

import UIKit

class CustomUISwitch: UISwitch {

    
    //MARK: - Counstuctor
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let standardHeight: CGFloat = 31
        let standardWidth: CGFloat = 51

        let heightRatio = 20 / standardHeight
        let widthRatio = 34 / standardWidth

        self.transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
        
        if #available(iOS 12.1, *) {
            if let thumb = self.subviews[0].subviews[1].subviews[2] as? UIImageView {
                thumb.transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
               }
        }
      
        
    }
    
    //MARK: - Setup View
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        onTintColor = #colorLiteral(red: 0.2039215686, green: 0.8705882353, blue: 0.8705882353, alpha: 1)
        tintColor = #colorLiteral(red: 1, green: 0.1921568627, blue: 0.4823529412, alpha: 1)
        backgroundColor = #colorLiteral(red: 1, green: 0.1921568627, blue: 0.4823529412, alpha: 1)
        layer.cornerRadius = self.frame.height / 2.0
        clipsToBounds = true
    }
    
    
    

}
