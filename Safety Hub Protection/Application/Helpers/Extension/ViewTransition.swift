//
//  ImageViewTransition.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 17.02.2021.
//

import UIKit

extension UIImageView{
    
    func setImage(_ image: UIImage?, duration: TimeInterval) {
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.image = image
        }, completion: nil)
    }
    
}


extension UILabel {
    
    func setText(_ text: String, duration: TimeInterval) {
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.text = text
        }, completion: nil)
    }
    
}
