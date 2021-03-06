//
//  SettingsModel.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 18.02.2021.
//
import UIKit

enum SettingsOption: Int, CustomStringConvertible, CaseIterable {
    
    case FAQ
    case HowToActivate
    case Support
    case Privacy
   
    var description: String {
        switch self {
        case .FAQ: return "About"
        case .HowToActivate: return "How To Activate"
        case .Privacy: return "Privacy Policy"
        case .Support: return "Support"
        }
    }

    var image: UIImage {
        switch self  {
        case .FAQ: return UIImage(named: "faq") ?? UIImage()
        case .HowToActivate: return UIImage(named: "howto") ?? UIImage()
        case .Privacy: return UIImage(named: "privacypolicy") ?? UIImage()
        case .Support: return UIImage(named: "help") ?? UIImage()
       }
    }
    
}
