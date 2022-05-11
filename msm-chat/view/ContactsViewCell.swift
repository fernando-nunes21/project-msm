//
//  ContactsViewCell.swift
//  msm-chat
//
//  Created by Fernando on 08/05/22.
//

import UIKit

class ContactsViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if(selected) {
            self.profileImage.alpha = 0.3
        } else {
            self.profileImage.alpha = 1
        }
    }

}
