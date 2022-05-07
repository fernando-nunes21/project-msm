//
//  User.swift
//  msm-chat
//
//  Created by Fernando on 17/04/22.
//

import Foundation

class User {
    var name : String!
    var status : String!
    var profileURL : URL!
    var username : String!
    
    init(name : String, status : String, profileURL : URL, username : String){
        self.name = name
        self.status = status
        self.profileURL = profileURL
        self.username = username
    }
}
