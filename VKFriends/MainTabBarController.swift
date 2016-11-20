//
//  MainTabBarController.swift
//  VKFriends
//
//  Created by Yana Ivanova on 20.11.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import UIKit
import SwiftyVK

class MainTabBarController: UITabBarController {

    var vkDelegate:BaseVKDelegate? = nil
    var vkFriends : Array<VKFriend>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(updateVKData), name: kVKDidAuthorizeNotification, object: nil)
        vkDelegate = BaseVKDelegate()
        VK.logIn()
    }

    func updateVKData() {
        VKWorker.sharedInstance.friendsGet(){(
            vkFriends: Array<VKFriend>?, error : NetworkCoreError?) in
            DispatchQueue.main.async {
                self.reloadTabsControllers(friends: vkFriends ?? [])
            }
        }
    }
    
    func reloadTabsControllers(friends: Array<VKFriend>) {
        for controller in viewControllers! {
            var tController: UIViewController? = controller
            if let navController = controller as? UINavigationController {
                tController = navController.viewControllers.first
            }
            if let reloadableController = tController as? ReloadableWithFriends {
                reloadableController.reloadContent(friends: friends)
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    

  

}
