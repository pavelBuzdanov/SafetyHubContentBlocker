//
//  OnboardingViewModel.swift
//  Porn Blocker
//
//  Created by  on 13.02.2021.
//

import Foundation


class OnboardingViewModel {
    
    //MARK: - Closures
    var reloadCollectionViewClosure: (()->())?
    
    //MARK: - Properies
    var model: [OnBoardingModel] = [OnBoardingModel]() {
        didSet {
            self.reloadCollectionViewClosure?()
        }
    }
    
    var numberOfItems: Int {
        return model.count
    }
    
    // MARK: - Retieve Data
    func getData( at indexPath: IndexPath ) -> OnBoardingModel {
        return model[indexPath.row]
    }
}
