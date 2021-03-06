//
//  OnboardingCollectionView.swift
//  Porn Blocker
//
//  Created by  on 13.02.2021.
//

import UIKit
import SnapKit

class OnboardingCollectionView: UICollectionView {
    
    //MARK: - Closures
    var collectionViewWillDispalayClosure: ((IndexPath)->())?
    
    
    //MARK: - Properties
    var adapter : OnboardingViewAdapter!
    
    lazy var viewModel: OnboardingViewModel = {
        return OnboardingViewModel()
    }()
    
    //MARK: - Constructor
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: frame, collectionViewLayout: layout)
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        isPagingEnabled = true
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        
        register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        
        adapter = OnboardingViewAdapter(delegate: self)
        dataSource = adapter
        delegate = adapter
        
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup View Model
    private func setupViewModel() {
        
        viewModel.reloadCollectionViewClosure = { [weak self] in
            self?.reloadData()
        }
        viewModel.model = OnBoardingModel.deafaultModel
    }
    
}

//MARK: - OnboardingProtocol
extension OnboardingCollectionView: OnboardingProtocol {
    
    func wiilDisplay(at index: IndexPath) {
        collectionViewWillDispalayClosure?(index)
    }
    
    
    func getData(at indexPath: IndexPath) -> OnBoardingModel {
        return self.viewModel.getData(at: indexPath)
    }
    
    func retrieveNumberOfSections() -> Int {
        return 1
    }
    
    func retrieveNumberOfItems() -> Int {
       return self.viewModel.numberOfItems
    }
    
}
