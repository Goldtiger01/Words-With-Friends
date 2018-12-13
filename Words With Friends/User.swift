//
//  User.swift
//  Words With Friends
//
//  Created by Hardy, Justin E on 12/11/18.
//  Copyright © 2018 Hardy, Justin E. All rights reserved.
//

import Foundation

class User {
    var username: String
    var password: String
    var friends: [String]
    var description: String {
        return "\(username)"
    }
    
    init( Name username: String, Password password: String ) {
        self.username = username
        self.password = password
        friends = []
    }
    
    func setPassword( Password password: String ) {
        self.password = password
    }
}
