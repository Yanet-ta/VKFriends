//
//  FriendTableViewCell.swift
//  VKFriends
//
//  Created by Yana Ivanova on 21.11.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func prepareForReuse() {
         nameLabel.text = nil
    }
    
    func updateContent(friend: VKFriend) {
        if friend.lastName != nil {
             nameLabel.text = friend.firstName + " " + friend.lastName!
        } else {
        nameLabel.text = friend.firstName
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
