//
//  SettingsViewController.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 18.02.2021.
//

import UIKit
import SnapKit
import MessageUI

class SettingsViewController: UIViewController {
    
    
    //MARK: - Views
    private let tableView = SettingsTableView()
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar() 
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
        
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(backButtonTapped))
        
        self.navigationItem.leftBarButtonItem = leftBarItem
        
        self.navigationItem.title = "Safety Hub"
        
    }
    
    //MARK: - Setup View
    private func setupView() {
        layoutView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        tableView.tableViewTranstionClosure = { [weak self] (option) in
            
            switch option  {
            case .FAQ: self?.presentOnboardingController()
            case .HowToActivate: self?.presentHowToController()
            case .Privacy: self?.presentWebView(link: AppConstants.privacy)
            case .Support: self?.presentMail()
            }
            
        }
    }
    
    //MARK: - Transitions
    private func presentWebView(link: String) {
        let vc = WebViewController()
        vc.urlString = link
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    private func presentHowToController(){
        self.navigationController?.pushViewController(HowToViewController(), animated: true)
    }
    
    private func presentOnboardingController(){
        let vc = OnboardingViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true, completion: nil)
    }
    
    private func presentMail() {
        if MFMailComposeViewController.canSendMail() {
            let mailVC = MFMailComposeViewController()
            mailVC.mailComposeDelegate = self
            mailVC.setSubject("Contact us!")
            mailVC.setToRecipients([AppConstants.email])
            mailVC.navigationBar.tintColor = .systemBlue
            mailVC.setEditing(true, animated: true)
            
            present(mailVC, animated: true) {
                mailVC.becomeFirstResponder()
            }
        } else {
            self.showAlertWithMassage("Error", "Sorry,but you can't send emails")
        }
    }
    
    
    //MARK: - Private functions
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Layout
    private func layoutView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        
    }
    
}



//MARK: MFMailComposeViewControllerDelegate
extension SettingsViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
