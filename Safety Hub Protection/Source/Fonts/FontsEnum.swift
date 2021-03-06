//
//  FontsEnum.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 17.02.2021.
//

import UIKit

enum Fonts: String {
    
    case sansBold = "SourceSansPro-Bold"
    case sansRegular = "SourceSansPro-Regular"
    case sansLight = "SourceSansPro-Light"
    
    func of(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}


