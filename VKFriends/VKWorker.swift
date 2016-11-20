//
//  VKWorker.swift
//  VKFriends
//
//  Created by Yana Ivanova on 20.11.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import Foundation
import SwiftyVK
//import Alamofire

class VKWorker {
   
    static let sharedInstance: VKWorker = {
        let instance = VKWorker()
        return instance
    }()
    
    func authorize() {
        VK.logIn()
        print("SwiftyVK: authorize")
    }
    
    func friendsGet() {
        VK.API.Friends.get([.count : "1", .fields : "city,domain"]).send(
            onSuccess: {response in print("!!!!SwiftyVK: friends.get success \n \(response)")},
            onError: {error in print("SwiftyVK: friends.get fail \n \(error)")}
        )
    }
    
}
