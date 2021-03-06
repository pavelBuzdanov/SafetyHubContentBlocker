//
//  AppDelegate.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 17.02.2021.
//

import UIKit

let sharedUserDeafults = UserDefaults(suiteName: SharedUserDeafults.suiteName)

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        guard let notFirstLaunch = sharedUserDeafults?.bool(forKey: SharedUserDeafults.Keys.onboardingState) else { return true}
        
        if notFirstLaunch {
            window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        } else {
            window?.rootViewController = OnboardingViewController()
        }
       
        window?.makeKeyAndVisible()
       
        return true
    }
    
  
    
    
}

