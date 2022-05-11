//
//  Contact.swift
//  msm-chat
//
//  Created by Fernando on 08/05/22.
//

import Foundation

class Contact {
    var id : String!
    var name : String!
    var username : String!
    var status : String!
    var profileImage : URL!
    
    init(id : String, name : String, username: String, status: String, profileImage: URL){
        self.id = id
        self.name = name
        self.username = username
        self.status = status
        self.profileImage = profileImage
    }
}
