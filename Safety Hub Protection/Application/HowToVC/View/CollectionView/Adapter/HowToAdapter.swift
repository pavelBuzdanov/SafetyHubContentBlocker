//
//  HowToAdapter.swift
//  Porn Blocker
//
//  Created by  on 15.02.2021.
//

import Foundation
import UIKit

class HowToAdapter: NSObject {

    //MARK: - Properties
    let delegate: HowToProtocol

    // MARK: - Constructor
    init(delegate:HowToProtocol) {
        self.delegate = delegate
    }
}

// MARK: - UICollectionViewDelegate implementation

extension HowToAdapter: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        delegate.wiilDisplay(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}


//MARK: - UICollectionViewDataSource
extension HowToAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        delegate.retrieveNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HowToCollectionViewCell.identifier, for: indexPath) as!  HowToCollectionViewCell
        
        cell.model = delegate.getData(at: indexPath)
        
        return cell
    }
}

