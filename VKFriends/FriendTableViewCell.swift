//
//  FriendTableViewCell.swift
//  VKFriends
//
//  Created by Yana Ivanova on 21.11.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import UIKit
import SDWebImage

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendPhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var isOnlineFlag: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        nameLabel.text = nil
        friendPhoto.image = nil
    }
    
    func updateContent(friend: VKFriend) {
        isOnlineFlag.isHidden = true
        if friend.lastName != nil {
             nameLabel.text = friend.firstName + " " + friend.lastName!
        } else {
        nameLabel.text = friend.firstName
        }
        //nameLabel.text = friend.firstName + " " + friend.lastName!
        let imageURL = URL(string: friend.friendPhoto)
        if let tempImageURL = imageURL {
            //friendPhoto.layer.cornerRadius = friendPhoto.frame.height / 2
            friendPhoto.sd_setImage(with: tempImageURL)
        }
        
        if friend.isOnline == 1 {
            isOnlineFlag.isHidden = false
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
