//
//  ActivatedViewModel.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 17.02.2021.
//

import UIKit


enum ActivatedViewState {
    
    
    case active
    case inactive
    
    
    var description: String {
        switch self {
        
        case .active : return "Browser protection activated"
        case .inactive: return "Browser protection is not activated"
            
        }
    }
    
    var image: UIImage {
        switch self {
        
        case .active : return UIImage(named: "activeImage") ?? UIImage()
        case .inactive: return UIImage(named: "inactiveImage") ?? UIImage()
            
        }
    }
    
    
    var backgroundColor: UIColor {
        switch self {
        
        case .active : return #colorLiteral(red: 0.2039215686, green: 0.8705882353, blue: 0.8705882353, alpha: 1)
        case .inactive: return #colorLiteral(red: 1, green: 0.1921568627, blue: 0.4823529412, alpha: 1)
            
        }
    }
    
    
}
