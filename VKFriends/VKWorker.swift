//
//  VKWorker.swift
//  VKFriends
//
//  Created by Yana Ivanova on 20.11.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import Foundation
import SwiftyVK

enum NetworkCoreError : Error {
    case ParseError(String)
    case NetworkError(Error)
}

let kVKDidAuthorizeNotification =  Notification.Name(rawValue: "VKDidAuthorizeNotification")

class VKWorker {
   
    static let sharedInstance: VKWorker = {
        let instance = VKWorker()
        return instance
    }()
    
    func friendsGet(completion : @escaping (Array<VKFriend>?, NetworkCoreError?) -> Void) {
        VK.API.Friends.get([.count : "", .fields : "city,domain,photo_100"]).send(
            onSuccess: {response in
                if let resultArray = self.parseResponse(json: response) {
                    completion(resultArray, nil)
                } else {
                    completion(nil, NetworkCoreError.ParseError("Can not parse \(response)"))
                }
        }, onError: {error in
            completion(nil, NetworkCoreError.NetworkError(error))
        })
    }
    
    func parseResponse(json: JSON) -> Array<VKFriend>? {
        print(json)
        var friends = Array<VKFriend>()
        let resultArray = json["items"].arrayValue
        for friend in resultArray {
            let newFriend = VKFriend(friendID: friend["id"].intValue,
                                     firstName: friend["first_name"].stringValue,
                                     lastName: friend["last_name"].stringValue,
                                     isOnline: friend["online"].intValue,
                                     cityName: friend["city"]["title"].stringValue,
                                     friendPhoto: friend["photo_100"].stringValue
            )
            friends.append(newFriend)
        }
        friends = friends.sorted(by: {$0.isOnline > $1.isOnline})
        return friends
    }
    

 }
