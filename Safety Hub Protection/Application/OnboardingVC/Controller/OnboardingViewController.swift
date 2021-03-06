//
//  OnboardingViewController.swift
//  Porn Blocker
//
//  Created by  on 13.02.2021.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {

    //MARK: - Subviews
    private let collectionView = OnboardingCollectionView()
    
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
        
        pageControll.numberOfPages = OnBoardingModel.deafaultModel.count
        pageControll.pageIndicatorTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        pageControll.currentPageIndicatorTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return pageControll
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "closewButton"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nextButton.layer.cornerRadius = 10
        nextButton.clipsToBounds = true
    }
    
    //MARK: - Setup View
    private func setupView() {
        layoutView()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.1921568627, blue: 0.4823529412, alpha: 1)
        
        collectionView.collectionViewWillDispalayClosure = { [weak self] (index) in
            self?.pageControll.currentPage = index.item

            if index.item == OnBoardingModel.deafaultModel.count - 1 {
                self?.nextButton.removeTarget(nil, action: nil, for: .allEvents)
                self?.nextButton.addTarget(self, action: #selector(self?.dismissAction), for: .touchUpInside)
            } else {
                self?.nextButton.removeTarget(nil, action: nil, for: .allEvents)
                self?.nextButton.addTarget(self, action: #selector(self?.nextButtonTapped), for: .touchUpInside)
            }
        }
    }
    
    
    //MARK: - Private Fuctions
    @objc private func dismissAction() {
        sharedUserDeafults?.set(true, forKey: SharedUserDeafults.Keys.onboardingState)
        let vc = UINavigationController(rootViewController: MainViewController())
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
 
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
        view.addSubview(closeButton)
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.snp.edges)
        }
        
        nextButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 180, height: 50))
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
        }
        
        pageControll.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(nextButton.snp.top).offset(-20)
        }
        
        closeButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 18, height: 18))
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.right.equalTo(view.snp.right).offset(-30)
        }
        
        
    }
    
    
}
