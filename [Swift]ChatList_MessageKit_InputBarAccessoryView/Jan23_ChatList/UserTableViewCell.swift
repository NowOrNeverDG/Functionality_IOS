//
//  UserTableViewCell.swift
//  Jan23_ChatList
//
//  Created by Ge Ding on 1/23/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLB: UILabel!
    @IBOutlet weak var userImgview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView?.contentMode = .scaleAspectFit
        self.imageView?.clipsToBounds = true


        self.userImgview?.image = UIImage(named: "UserProfile")
        self.userImgview.layer.cornerRadius = 15
        self.userImgview.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
