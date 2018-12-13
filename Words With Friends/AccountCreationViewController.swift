//
//  AccountCreationViewController.swift
//  Words With Friends
//
//  Created by Hardy, Justin E on 12/7/18.
//  Copyright © 2018 Hardy, Justin E. All rights reserved.
//

import UIKit

class AccountCreationViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func createAccount(_ sender: UIButton) {
        var user: User?
        if( isUnique(Username: usernameField.text!) && matches(Password1: passwordField.text!, Password2: confirmField.text!) ) {
            user = User(Name: usernameField.text!, Password: passwordField.text!)
            
            uploadAccount(Account: user!)
        }
    }
    
    private func isUnique( Username username: String) -> Bool {
        return username != ""
    }
    
    private func matches( Password1 password1: String, Password2 password2: String) -> Bool {
        return password1 != "" && password2 != "" && password1 == password2
    }
    
    private func uploadAccount( Account user: User ) {
        // Add code to upload the account to the database
        
    }
}
