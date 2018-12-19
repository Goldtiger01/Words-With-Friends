//
//  User.swift
//  Words With Friends
//
//  Created by Hardy, Justin E on 12/11/18.
//  Copyright © 2018 Hardy, Justin E. All rights reserved.
//

import Foundation

class User {
    public static var users: [User] = []
    public static var currentAccount: User? = nil
    
    var username: String
    var password: String
    var description: String {
        return "\(username)~\(password)"
    }
    
    init( Name username: String, Password password: String ) {
        self.username = username
        self.password = password
    }
    
    func setPassword( Password password: String ) {
        self.password = password
    }
}
