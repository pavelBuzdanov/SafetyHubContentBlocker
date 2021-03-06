//
//  OnboardingProtocol.swift
//  Porn Blocker
//
//  Created by  on 13.02.2021.
//

import Foundation

protocol OnboardingProtocol {
    
    func wiilDisplay(at index: IndexPath)
    func getData(at indexPath: IndexPath) -> OnBoardingModel
    func retrieveNumberOfSections() -> Int
    func retrieveNumberOfItems() -> Int
    
}
