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
    var friendPhoto: String
    
    init() {
        friendID = 0
        firstName = ""
        lastName = ""
        isOnline = 0
        cityName = ""
        friendPhoto = ""
    }
    
    init(friendID: Int, firstName: String, lastName: String, isOnline: Int, cityName: String, friendPhoto: String) {
        self.friendID = friendID
        self.firstName = firstName
        self.lastName = lastName
        self.isOnline = isOnline
        self.cityName = cityName
        self.friendPhoto = friendPhoto
    }
    
}
