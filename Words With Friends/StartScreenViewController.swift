//
//  ViewController.swift
//  Words With Friends
//
//  Created by Hardy, Justin E on 12/7/18.
//  Copyright © 2018 Hardy, Justin E. All rights reserved.
//

import UIKit
import Darwin

class StartScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readAccounts()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func Exit(_ sender: Any) {
        exit(0)
    }
    
    private func readAccounts() -> Void {
        let fileName = "Accounts"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        var readString: String = ""
        
        do {
            try readString = try String(contentsOf: fileURL)
        } catch let error as NSError {
            print("Failed to read from URL")
            print(error)
            return
        }
        
        if(readString.isEmpty) {
            return
        }
        
        let splits: [Substring] = readString.split(separator: ",")
        var readAccounts: [String] = []
        for split in splits {
            readAccounts.append( String(split) )
        }
        
        for user in readAccounts {
            let account = user.split(separator: "~")
            User.users.append( User(Name: String(account[0]), Password: String(account[1])) )
        }
        
        print("Read from \(fileURL)")
    }
}

