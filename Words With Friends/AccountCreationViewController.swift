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
    @IBOutlet weak var warningLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLabel.isHidden = true
    }

    @IBAction func createAccount(_ sender: UIButton) {
        warningLabel.isHidden = true
        var user: User?
        
        guard isUnique(Username: usernameField.text!) else {
            warningLabel.isHidden = false
            warningLabel.text = "The username is not unique."
            return
        }
        guard matches(Password1: passwordField.text!, Password2: confirmField.text!) else {
            warningLabel.isHidden = false
            warningLabel.text = "The passwords entered do not match."
            return
        }
        guard usernameField.text!.split(separator: " ").count == 1 && passwordField.text!.split(separator: " ").count == 1 else {
            warningLabel.isHidden = false
            warningLabel.text = "You cannot have spaces in your username/password"
            return
        }
        guard usernameField.text!.split(separator: ",").count == 1 && usernameField.text!.split(separator: "~").count == 1 &&
            passwordField.text!.split(separator: ",").count == 1 && passwordField.text!.split(separator: "~").count == 1 else {
                warningLabel.isHidden = false
                warningLabel.text = "The use of commas and/or tildes are not allowed."
                return
        }
        
        user = User(Name: usernameField.text!, Password: passwordField.text!)
        uploadAccount(Account: user!)
        performSegue(withIdentifier: "Account Created", sender: sender)
    }
    
    private func isUnique( Username username: String) -> Bool {
        for user in User.users{
            if username == user.username {
                return false
            }
        }
        return true
    }
    
    private func matches( Password1 password1: String, Password2 password2: String) -> Bool {
        return password1 != "" && password2 != "" && password1 == password2
    }
    
    private func uploadAccount( Account user: User ) {
        // Write account details to a text file.
        let fileName = "Accounts"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        print("File Path: \(fileURL.path)")
        
        var writeString: String = ""
        for user in User.users {
            writeString += "\(user.description),"
        }
        
        writeString += user.description
        
        print("Saved to \(fileURL)")
        
        do {
            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed to write to URL")
            print(error)
            return
        }
        
        User.users.append(user)
    }
}
