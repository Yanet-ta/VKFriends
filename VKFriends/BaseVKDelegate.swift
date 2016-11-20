//
//  BaseVKDelegate.swift
//  VKFriends
//
//  Created by Yana Ivanova on 20.11.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import Foundation
import SwiftyVK

class BaseVKDelegate: VKDelegate {

    let appID = Constants.appID
    let scope: Set<VK.Scope> = [.offline,.friends]
    
    init() {
        VK.config.logToConsole = true
        VK.configure(withAppId: appID, delegate: self)
    }
    
    func vkWillAuthorize() -> Set<VK.Scope> {
        print("vkWillAuthorize")
        return scope
    }
    
    func vkDidAuthorizeWith(parameters: Dictionary<String, String>) {
        print("vkDidAuthorize \(parameters)")
        // Called when the user is log in.
        // Here you can start to send requests to the API.
        NotificationCenter.default.post(name: kVKDidAuthorizeNotification, object: nil)
    }
    
    func vkDidUnauthorize() {
        // Called when user is log out.
    }
    
    func vkAutorizationFailedWith(error: AuthError) {
        // Called when SwiftyVK could not authorize. To let the application know that something went wrong.
        print("Autorization failed with error: \n\(error)")
    }
    
    func vkShouldUseTokenPath() -> String? {
        // Called when SwiftyVK need know where a token is located.
        return nil // Path to save/read token or nil if should save token to UserDefaults
    }
    
    func vkWillPresentView() -> UIViewController {
        // Called when need to display a view from SwiftyVK.
        return UIApplication.shared.delegate!.window!!.rootViewController!
    }
}
