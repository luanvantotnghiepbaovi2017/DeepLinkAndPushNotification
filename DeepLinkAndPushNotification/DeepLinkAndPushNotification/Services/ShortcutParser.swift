//
//  ShortcutParser.swift
//  DeepLinkAndPushNotification
//
//  Created by Tran Quoc Bao on 5/7/18.
//  Copyright © 2018 Tran Quoc Bao. All rights reserved.
//

import UIKit

enum ShortcutKey: String {
    case newListing = "com.myApp.newListing"
    case activity = "com.myApp.activity"
    case messages = "com.myApp.messages"
}

class ShortcutParser {
    // MARK: Properties
    static let shared = ShortcutParser()
    
    // MARK: Constructor
    private init() {}
    
    // MARK: Methods
    func registerShortcuts(for profileType: ProfileType) {
        let activityIcon = UIApplicationShortcutIcon(templateImageName: "Alert Icon")
        let activityShortcutItem = UIApplicationShortcutItem(type: ShortcutKey.activity.rawValue, localizedTitle: "Recent Activity", localizedSubtitle: nil, icon: activityIcon, userInfo: nil)
        
        let messageIcon = UIApplicationShortcutIcon(templateImageName: "Messenger Icon")
        let messageShortcutItem = UIApplicationShortcutItem(type: ShortcutKey.messages.rawValue, localizedTitle: "Messages", localizedSubtitle: nil, icon: messageIcon, userInfo: nil)
        
        UIApplication.shared.shortcutItems = [activityShortcutItem, messageShortcutItem]
        
        switch profileType {
        case .host:
            let newListingIcon = UIApplicationShortcutIcon(templateImageName: "New Listing Icon")
            let newListingShortcutItem = UIApplicationShortcutItem(type: ShortcutKey.newListing.rawValue, localizedTitle: "New Listing", localizedSubtitle: nil, icon: newListingIcon, userInfo: nil)
            
            UIApplication.shared.shortcutItems?.append(newListingShortcutItem)
        case .guest:
            break
        }
    }
    
    func handleShortcut(_ shortcut: UIApplicationShortcutItem) -> DeepLinkType? {
        switch shortcut.type {
        case ShortcutKey.activity.rawValue:
            return .activity
        case ShortcutKey.messages.rawValue:
            return .messages(.root)
        case ShortcutKey.newListing.rawValue:
            return .newListing
        default:
            return nil
        }
    }
}
