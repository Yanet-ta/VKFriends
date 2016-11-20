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
        
        VK.API.Friends.get([.count : "", .fields : "city,domain"]).send(
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
        if json.type == .dictionary {
            let friendsCount = json["count"]
            if friendsCount.type == .number {
                let countValue = friendsCount.intValue
                if countValue > 0 {
                    
                    if json["items"].type == .array {
                        let itemsList = json["items"]
                        var friends = Array<VKFriend>()
                        
                        for index in 0...itemsList.count{
                            let friend = VKFriend()
                            if itemsList[index].type == .dictionary {
                                let itemJSON = itemsList[index]
                                
                                friend.firstName = itemJSON["first_name"].stringValue
                                friend.lastName = itemJSON["last_name"].stringValue
                                
                                if itemJSON["city"].type == .dictionary {
                                    friend.cityName = itemJSON["city"]["title"].stringValue
                                }
                            }
                            friends.append(friend)
                            
                        }
                        return friends
                        
                    }
                } else {
                    print("Fail")
                }
            }
        }
        return nil
    }
    
}
