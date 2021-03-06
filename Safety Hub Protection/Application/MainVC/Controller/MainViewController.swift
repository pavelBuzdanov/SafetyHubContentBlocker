//
//  MainViewController.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 17.02.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    
    //MARK: - SubViews
    private let mainView = MainView()
    
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    
    //MARK: - Setup NavigationBar
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : Fonts.sansRegular.of(size: 16),
            NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.1333333333, green: 0.1294117647, blue: 0.3568627451, alpha: 1)
        ]
            
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        let rightBarItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        
        self.navigationItem.rightBarButtonItem = rightBarItem
        
        self.navigationItem.title = "Safety Hub"
        
    }
    
    
    //MARK: - Setup View
    private func setupView() {
        layoutView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    
    
    //MARK: - Private functions
    @objc private func settingsButtonTapped() {
        showSettingVC()
    }
    
    
    
    //MARK: - Transitions
    private func showSettingVC() {
        self.navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
    
    
    //MARK: - Layout
    private func layoutView() {
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
}




