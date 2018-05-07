//
//  DeeplinkParser.swift
//  DeepLinkAndPushNotification
//
//  Created by Tran Quoc Bao on 5/7/18.
//  Copyright © 2018 Tran Quoc Bao. All rights reserved.
//

import Foundation

class DeeplinkParser {
    // MARK: Properties
    static let shared = DeeplinkParser()
    
    // MARK: Constructor
    private init() {}
    
    // MARK: Methods
    func parseDeepLink(_ url: URL) -> DeepLinkType? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true), let host = components.host else { return nil }
        
        var pathComponents = components.path.components(separatedBy: "/")
        
        // the first component is empty
        pathComponents.removeFirst()
        
        switch host {
        case "messages":
            if let messageId = pathComponents.first {
                return DeepLinkType.messages(.details(id: messageId))
            }
        case "request":
            if let requestId = pathComponents.first {
                return DeepLinkType.request(id: requestId)
            }
        default:
            break
        }
        return nil
    }
}
