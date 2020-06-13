//
//  User.swift
//  Guitar Legend
//
//  Created by user167401 on 6/11/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation


class User {
    
    
    var uId : String
    var currentChallenge : Int
    
    init(uId : String, currentChallenge : Int) {
        
        self.uId = uId
        self.currentChallenge = currentChallenge
        
    }
    
    static func toUser(json: [String : Any]) ->User {
        
        return User(uId: json["uId"] as! String, currentChallenge: json["currentChallenge"] as! Int)
    }
    
    
}
