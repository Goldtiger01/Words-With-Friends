//
//  AccountViewController.swift
//  Words With Friends
//
//  Created by Hardy, Justin E on 12/19/18.
//  Copyright © 2018 Hardy, Justin E. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        usernameLabel.text = "Username: \(User.currentAccount!.username)"
        passwordLabel.text = "Password: \(User.currentAccount!.password)"
    }
}
