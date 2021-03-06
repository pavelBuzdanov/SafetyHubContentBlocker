//
//  Animator.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 17.02.2021.
//

import UIKit


struct Animator {
    
    let handler: () -> Void
    
}


extension Animator {
    
    static func scaleAnimation(view: UIView, duration: TimeInterval, delay: TimeInterval, options: UIView.AnimationOptions, scaleX: CGFloat, scaleY: CGFloat, complition: ((Bool) -> Void)? = nil) -> Self {
        return Animator.init {
            UIView.animate(withDuration: duration/2, delay: delay, options: options) {
                view.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
            } completion: { (_) in
                UIView.animate(withDuration: duration/2, delay: delay, options: options, animations: {
                    view.transform = CGAffineTransform.identity
                }, completion: complition)
            }
        }
    }  
}
