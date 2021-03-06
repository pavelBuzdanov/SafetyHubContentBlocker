//
//  HowToProtocol.swift
//  Porn Blocker
//
//  Created by on 15.02.2021.
//

import Foundation

protocol HowToProtocol {
    
    func wiilDisplay(at index: IndexPath)
    func getData(at indexPath: IndexPath) -> HowToModel
    func retrieveNumberOfSections() -> Int
    func retrieveNumberOfItems() -> Int
    
}
