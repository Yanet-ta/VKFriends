//
//  VKFriend.swift
//  VKFriends
//
//  Created by Yana Ivanova on 20.11.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import Foundation

class VKFriend {
    
    var friendID: Int
    var firstName: String
    var lastName: String?
    var isOnline: Int
    var cityName: String?
    
    init() {
        friendID = 0
        firstName = ""
        lastName = ""
        isOnline = 0
        cityName = ""
    }
    
}
