//
//  ConversationViewCell.swift
//  msm-chat
//
//  Created by Fernando on 06/05/22.
//

import UIKit

class ConversationViewCell: UITableViewCell {
    
    
    
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
