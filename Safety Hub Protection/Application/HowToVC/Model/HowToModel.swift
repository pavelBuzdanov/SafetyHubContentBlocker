//
//  HowToNodel.swift
//  Porn Blocker
//
//  Created by  on 15.02.2021.
//

import Foundation

struct HowToModel {
    
    let description: String
    let imageName: String
}


extension HowToModel {
    
    static let deafaultModel = [
        HowToModel(description: "OPEN \nSETTINGS", imageName: "1"),
        HowToModel(description: "TAP \nON SAFARI", imageName: "2"),
        HowToModel(description: "SELECT \nCONTENT BLOCKERS", imageName: "3"),
        HowToModel(description: "ENABLE ALL", imageName: "4"),
        HowToModel(description: "ACTIVATE IN APP", imageName: "5"),
    ]
    
}
