//
//  DeepLinkManager.swift
//  DeepLinkAndPushNotification
//
//  Created by Tran Quoc Bao on 5/7/18.
//  Copyright © 2018 Tran Quoc Bao. All rights reserved.
//

import UIKit

enum DeepLinkType {
    enum Messages {
        case root
        case details(id: String)
    }
    
    case messages(Messages)
    case activity
    case newListing
    case request(id: String)
}

let Deeplinker = DeepLinkManager()

class DeepLinkManager {
    // MARK: Constructor
    fileprivate init() {}
    
    // MARK: Properties
    private var deeplinkType: DeepLinkType?
    
    // MARK: Methods
    // check existing deepling and perform action
    func checkDeepLink() {
        guard let deeplinkType = deeplinkType else { return }
        
        DeepLinkNavigator.shared.proceedToDeepLink(deeplinkType)
        
        // reset deeplink after handling
        self.deeplinkType = nil
    }
    
    @discardableResult
    func handleShortcut(item: UIApplicationShortcutItem) -> Bool {
        deeplinkType = ShortcutParser.shared.handleShortcut(item)
        return deeplinkType != nil
    }
    
    @discardableResult
    func handleDeeplink(url: URL) -> Bool {
        deeplinkType = DeeplinkParser.shared.parseDeepLink(url)
        return deeplinkType != nil
    }
}
