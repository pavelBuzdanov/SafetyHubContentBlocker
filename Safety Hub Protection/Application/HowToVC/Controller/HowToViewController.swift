//
//  HowToViewController.swift
//  Porn Blocker
//
//  Created by on 15.02.2021.
//

import UIKit

class HowToViewController: UIViewController {

    //MARK: - Subviews
    private let collectionView = HowToCollectionView()
    
    private let nextButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = Fonts.sansBold.of(size: 18)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        return button
    }()

    private let pageControll: UIPageControl = {
       let pageControll = UIPageControl()
        pageControll.translatesAutoresizingMaskIntoConstraints = false
        pageControll.currentPage = 0
        pageControll.numberOfPages = HowToModel.deafaultModel.count
        pageControll.pageIndicatorTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        pageControll.currentPageIndicatorTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return pageControll
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nextButton.layer.cornerRadius = 20
        nextButton.clipsToBounds = true
    }
    
    //MARK: - Setup Navigation Bar
    private func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : Fonts.sansRegular.of(size: 16),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        navigationItem.title = "How To Activate"
        
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "closewButton"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = leftBarItem
    }
    
    //MARK: - SetupView
    private func setupView() {
        layoutView()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.1921568627, blue: 0.4823529412, alpha: 1)
        
        collectionView.collectionViewWillDispalayClosure = { [weak self] (index) in
            self?.pageControll.currentPage = index.item
            
            if index.item == HowToModel.deafaultModel.count - 1 {
                self?.nextButton.setTitle("Open Settings", for: .normal)
                self?.nextButton.removeTarget(nil, action: nil, for: .allEvents)
                self?.nextButton.addTarget(self, action: #selector(self?.openSettingsAction), for: .touchUpInside)
            } else {
                self?.nextButton.setTitle("Next", for: .normal)
                self?.nextButton.removeTarget(nil, action: nil, for: .allEvents)
                self?.nextButton.addTarget(self, action: #selector(self?.nextButtonTapped), for: .touchUpInside)
            }
        }
        
    }
    
    
    
    //MARK: - Private functions
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Private Fuctions
    @objc private func openSettingsAction() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {return }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in })
        }
    }
    
    @objc private func nextButtonTapped() {
        guard let currentPage = collectionView.indexPathsForVisibleItems.first else { return }
        
        let nextIndexPath = IndexPath(item: currentPage.row + 1, section: currentPage.section)
        
        collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    //MARK: - LayoutView
    private func layoutView() {
        view.addSubview(collectionView)
        view.addSubview(nextButton)
        view.addSubview(pageControll)
        
        nextButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 180, height: 50))
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
        }
        
        pageControll.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(nextButton.snp.top).offset(-20)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(pageControll.snp.top).offset(-5)
        }
    }

}


