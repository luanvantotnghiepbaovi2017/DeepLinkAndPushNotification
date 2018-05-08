//
//  DeepLinkNavigator.swift
//  DeepLinkAndPushNotification
//
//  Created by Tran Quoc Bao on 5/7/18.
//  Copyright © 2018 Tran Quoc Bao. All rights reserved.
//

import UIKit

class DeepLinkNavigator {
    // MARK: Properties
    static let shared = DeepLinkNavigator()
    private var alertController = UIAlertController()
    
    // MARK: Constructor
    private init() {}
    
    // MARK: Methods
    func proceedToDeepLink(_ type: DeepLinkType) {
        switch type {
        case .activity:
            displayAlert(title: "Activity")
        case .messages(.root):
            displayAlert(title: "Messages Root")
        case .messages(.details(id: let id)):
            displayAlert(title: "Messages Details \(id)")
        case .messages(.deepLink(url: let url)):
            displayAlert(title: "Deeplink: \(url)")
        case .newListing:
            displayAlert(title: "New Listing")
        case .request(id: let id):
            displayAlert(title: "Request Details \(id)")
        }
    }
    
    private func displayAlert(title: String) {
        alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okButton)
        
        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            if vc.presentedViewController != nil {
                alertController.dismiss(animated: false, completion: {
                    vc.present(self.alertController, animated: true, completion: nil)
                })
            } else {
                vc.present(self.alertController, animated: true, completion: nil)
            }
        }
    }
}
