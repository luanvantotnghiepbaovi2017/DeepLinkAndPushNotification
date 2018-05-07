//
//  ViewController.swift
//  DeepLinkAndPushNotification
//
//  Created by Tran Quoc Bao on 5/7/18.
//  Copyright © 2018 Tran Quoc Bao. All rights reserved.
//

import UIKit

enum ProfileType: String {
    case guest = "Guest" //default
    case host = "Host"
}

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    
    // MARK: IBActions
    @IBAction func didPressSwitchProfile(_ sender: Any) {
        currentProfile = currentProfile == .guest ? .host : .guest
        configureFor(profileType: currentProfile)
    }
    
    // MARK: Properties
    var currentProfile = ProfileType.guest
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFor(profileType: currentProfile)
    }
    
    func configureFor(profileType: ProfileType) {
        title = profileType.rawValue
        ShortcutParser.shared.registerShortcuts(for: profileType)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning - ViewController")
    }
    
}
