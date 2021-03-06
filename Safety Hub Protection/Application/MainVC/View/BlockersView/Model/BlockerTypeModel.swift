//
//  BlockerTypeModel.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 17.02.2021.
//

import UIKit


enum BlockerTypeModel {
    
    case adsBlocker
    case pornBlocker
    case malwareBlocker
    case trackBlocker
    
    
    var description: String {
        switch self {
        
        case .adsBlocker : return "Advertising Blocker"
        case .pornBlocker: return "Porn Sites Blocker"
        case .malwareBlocker: return "Malware Blocker"
        case .trackBlocker: return "Tracking Blocker"
        }
    }
    
    var image: UIImage {
        switch self {
        
        case .adsBlocker : return UIImage(named: "ads") ?? UIImage()
        case .pornBlocker: return UIImage(named: "porn") ?? UIImage()
        case .malwareBlocker: return UIImage(named: "malware") ?? UIImage()
        case .trackBlocker: return UIImage(named: "track") ?? UIImage()
        }
    }
    
    
    var textColor: UIColor {
        switch self {
        
        case .adsBlocker : return #colorLiteral(red: 0.2549019608, green: 0.368627451, blue: 0.7137254902, alpha: 1)
        case .pornBlocker: return #colorLiteral(red: 0.6745098039, green: 0.2509803922, blue: 0.2509803922, alpha: 1)
        case .malwareBlocker:  return #colorLiteral(red: 1, green: 0.6941176471, blue: 0.06274509804, alpha: 1)
        case .trackBlocker:  return #colorLiteral(red: 0.137254902, green: 0.6901960784, blue: 0.6901960784, alpha: 1)
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        
        case .adsBlocker : return #colorLiteral(red: 0.9333333333, green: 0.968627451, blue: 0.9960784314, alpha: 1)
        case .pornBlocker: return #colorLiteral(red: 0.9960784314, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        case .malwareBlocker:  return #colorLiteral(red: 1, green: 0.9843137255, blue: 0.9254901961, alpha: 1)
        case .trackBlocker:  return #colorLiteral(red: 0.9411764706, green: 1, blue: 1, alpha: 1)
        }
    }
}
