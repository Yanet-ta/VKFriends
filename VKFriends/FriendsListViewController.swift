//
//  FriendsListViewController.swift
//  VKFriends
//
//  Created by Yana Ivanova on 20.11.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import UIKit
import SwiftyVK

protocol ReloadableWithFriends {
    func reloadContent(friends: Array<VKFriend>)
}

class FriendsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  ,ReloadableWithFriends{
    
    @IBOutlet weak var tableView: UITableView!
    var friendItems:Array<VKFriend> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Friends"
        
    }

    func reloadContent(friends: Array<VKFriend>) {
        self.friendItems = friends
        tableView.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableViewCell
        cell.updateContent(friend: self.friendItems[indexPath.row])
        return cell
    }
    

}
