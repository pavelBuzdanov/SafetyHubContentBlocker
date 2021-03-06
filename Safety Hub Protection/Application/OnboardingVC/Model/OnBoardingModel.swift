//
//  OnBoardingModel.swift
//  Porn Blocker
//
//  Created by  on 13.02.2021.
//

import Foundation


struct OnBoardingModel {
    
    let imageViewName: String
    let mainText: String
    
}

extension OnBoardingModel {
    
    static let deafaultModel = [
        OnBoardingModel(imageViewName: "1o", mainText: "Keeps you safe 24/7"),
        OnBoardingModel(imageViewName: "2o", mainText: "High Technology \nProtection"),
        OnBoardingModel(imageViewName: "3o", mainText: "Defends You From The \nLatest Threats"),
    ]
}
