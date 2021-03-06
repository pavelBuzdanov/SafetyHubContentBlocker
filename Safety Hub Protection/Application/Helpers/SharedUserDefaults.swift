//
//  SharedUserDefaults.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 18.02.2021.
//

import Foundation

struct  SharedUserDeafults {
    static let suiteName = AppConstants.appGroup
    
    struct Keys {
        static let onboardingState = "onboardingState"
        static let activatedViewState = "activatedViewState"
        static let adsBlockerState = "adsBlockerState"
        static let pornBlockerState = "pornBlockerState"
        static let malwareBlockerState = "malwareBlockerState"
        static let trackBlockerState = "tackBlockerState"
    }
}
