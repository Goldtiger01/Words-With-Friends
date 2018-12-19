//
//  LoginViewController.swift
//  Words With Friends
//
//  Created by Hardy, Justin E on 12/7/18.
//  Copyright © 2018 Hardy, Justin E. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLabel.isHidden = true
        for user in User.users {
            print(user.description)
        }
    }
    
    @IBAction func Login(_ sender: Any) {
        warningLabel.isHidden = true
        for user in User.users {
            if(user.username == usernameField.text!){
                if(user.password == passwordField.text!){
                    performSegue(withIdentifier: "Login", sender: sender)
                    User.currentAccount = user
                    return
                }
                else{
                    warningLabel.isHidden = false
                    warningLabel.text = "Incorrect password for account \"\(user.username)\"."
                }
            }
        }
        warningLabel.isHidden = false
        warningLabel.text = "This username does not exist."
    }
    
    
}
