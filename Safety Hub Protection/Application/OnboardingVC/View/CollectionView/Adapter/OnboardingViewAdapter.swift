//
//  OnboardingViewAdapter.swift
//  Porn Blocker
//
//  Created by  on 13.02.2021.
//
import Foundation
import UIKit

class OnboardingViewAdapter: NSObject {

    //MARK: - Properties 
    let delegate: OnboardingProtocol

    // MARK: - Constructor
    init(delegate:OnboardingProtocol) {
        self.delegate = delegate
    }
}

// MARK: - UICollectionViewDelegate implementation

extension OnboardingViewAdapter: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        delegate.wiilDisplay(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}


//MARK: - UICollectionViewDataSource
extension OnboardingViewAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        delegate.retrieveNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as!  OnboardingCollectionViewCell
        
        cell.model = delegate.getData(at: indexPath)
        
        return cell
    }
}
