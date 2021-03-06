//
//  HowToViewModel.swift
//  Porn Blocker
//
//  Created by  on 15.02.2021.
//

import Foundation

class HowToViewModel {
    
    //MARK: - Closures
    var reloadCollectionViewClosure: (()->())?
    
    //MARK: - Properies
    var model: [HowToModel] = [HowToModel]() {
        didSet {
            self.reloadCollectionViewClosure?()
        }
    }
    
    var numberOfItems: Int {
        return model.count
    }
    
    // MARK: - Retieve Data
    func getData( at indexPath: IndexPath ) -> HowToModel {
        return model[indexPath.row]
    }
}
