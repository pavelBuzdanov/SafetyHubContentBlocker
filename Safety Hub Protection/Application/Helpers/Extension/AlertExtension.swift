//
//  AlertExtension.swift
//  Safety Hub Protection
//
//  Created by Pavel Buzdanov on 18.02.2021.
//
import UIKit

extension UIViewController {
    
    func showAlertWithMassage(_ title: String, _ massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
