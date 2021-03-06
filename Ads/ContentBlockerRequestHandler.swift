//
//  ContentBlockerRequestHandler.swift
//  Ads
//
//  Created by Pavel Buzdanov on 18.02.2021.
//

import UIKit
import MobileCoreServices



class ContentBlockerRequestHandler: NSObject, NSExtensionRequestHandling {

    func beginRequest(with context: NSExtensionContext) {
    
        let sharedUserDeafults = UserDefaults(suiteName: SharedUserDeafults.suiteName)
        
        guard let mainOn = sharedUserDeafults?.bool(forKey: SharedUserDeafults.Keys.activatedViewState) else { return }
        guard let adsBlockerOn = sharedUserDeafults?.bool(forKey: SharedUserDeafults.Keys.adsBlockerState) else { return }
        
        if mainOn {
            if adsBlockerOn {
                let attachment = NSItemProvider(contentsOf: Bundle.main.url(forResource: "adsList", withExtension: "json"))!
                
                let item = NSExtensionItem()
                item.attachments = [attachment]
                
                context.completeRequest(returningItems: [item], completionHandler: nil)
            } else {
                let attachment = NSItemProvider(contentsOf: Bundle.main.url(forResource: "adsListZero", withExtension: "json"))!
                
                let item = NSExtensionItem()
                item.attachments = [attachment]
                
                context.completeRequest(returningItems: [item], completionHandler: nil)
            }
        } else {
            let attachment = NSItemProvider(contentsOf: Bundle.main.url(forResource: "adsListZero", withExtension: "json"))!
            
            let item = NSExtensionItem()
            item.attachments = [attachment]
            
            context.completeRequest(returningItems: [item], completionHandler: nil)
            
        }
    }
    
}
