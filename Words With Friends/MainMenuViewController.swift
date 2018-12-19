//
//  LoggedInViewController.swift
//  Words With Friends
//
//  Created by Hardy, Justin E on 12/7/18.
//  Copyright © 2018 Hardy, Justin E. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func LogOut(_ sender: Any) {
        User.currentAccount = nil
        performSegue(withIdentifier: "Log Out", sender: sender)
    }
}
