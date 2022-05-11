//
//  Conversation.swift
//  msm-chat
//
//  Created by Fernando on 08/05/22.
//

import Foundation

class Conversation {
    var id : String!
    var lastMessage : String!
    var sendAt : Date!
    var senderProfileImage : URL!
    var fromUser : String!
    var toUser : String!
    
    init(id : String, lastMessage: String, sendAt: Date, senderProfileImage : URL, fromUser : String, toUser : String){
        self.id = id
        self.lastMessage = lastMessage
        self.sendAt = sendAt
        self.senderProfileImage = senderProfileImage
        self.fromUser = fromUser
        self.toUser = toUser
    }
}
