//
//  NotificationParser.swift
//  DeepLinkAndPushNotification
//
//  Created by Tran Quoc Bao on 5/8/18.
//  Copyright © 2018 Tran Quoc Bao. All rights reserved.
//

import Foundation

class NotificationParser {
    // MARK: Properties
    static let shared = NotificationParser()
    
    // MARK: Constructor
    private init() {}
    
    // MARK: Methods
    func handleNotification(_ userInfo: [AnyHashable: Any]) -> DeepLinkType? {
//        if let data = userInfo["data"] as? [String: Any] {
//            if let messageId = data["messageId"] as? String {
//                return DeepLinkType.messages(.details(id: messageId))
//            }
//            if let requestId = data["requestId"] as? String {
//                return DeepLinkType.request(id: requestId)
//            }
//        }
        if let custom = userInfo["custom"] as? [String: Any] {
            if let data = custom["a"] as? [String: Any] {
                if let deepLink = data["deepLink"] as? String {
                    return DeepLinkType.messages(.deepLink(url: deepLink))
                }
            }
        }
        return nil
    }
}
