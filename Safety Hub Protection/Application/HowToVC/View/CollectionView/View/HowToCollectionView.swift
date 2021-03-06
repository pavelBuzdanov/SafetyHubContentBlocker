//
//  HowToCollectionView.swift
//  Porn Blocker
//
//  Created by  on 15.02.2021.
//

import UIKit

class HowToCollectionView: UICollectionView {
    
    //MARK: - Closures
    var collectionViewWillDispalayClosure: ((IndexPath)->())?
    
    
    //MARK: - Properties
    var adapter : HowToAdapter!
    
    lazy var viewModel: HowToViewModel = {
        return HowToViewModel()
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
        
        register(HowToCollectionViewCell.self, forCellWithReuseIdentifier: HowToCollectionViewCell.identifier)
        
        adapter = HowToAdapter(delegate: self)
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
        viewModel.model = HowToModel.deafaultModel
    }
    
}

//MARK: - OnboardingProtocol
extension HowToCollectionView: HowToProtocol {
    
    func wiilDisplay(at index: IndexPath) {
        collectionViewWillDispalayClosure?(index)
    }
    
    
    func getData(at indexPath: IndexPath) -> HowToModel {
        return self.viewModel.getData(at: indexPath)
    }
    
    func retrieveNumberOfSections() -> Int {
        return 1
    }
    
    func retrieveNumberOfItems() -> Int {
       return self.viewModel.numberOfItems
    }
    
    
}
