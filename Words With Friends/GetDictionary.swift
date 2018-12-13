//
//  GetDictionary.swift
//  Words With Friends
//
//  Created by Garrigus, Justin on 12/13/18.
//  Copyright © 2018 Hardy, Justin E. All rights reserved.
//

import Foundation

struct GetDictionary
{
    static func getDictionary() -> NSMutableSet
    {
        return separateString(bigString: getTextFromFile())
    }
    
    static func getTextFromFile() -> String
    {
        let fileName = "Test"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        var readString = "" // Used to store the file contents
        do {
            // Read the file contents
            readString = try String(contentsOf: fileURL)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
        
        return readString
    }
    
    static func separateString(bigString: String) -> NSMutableSet
    {
        let dictionary = NSMutableSet()
        var lines: [String] = []
        
        bigString.enumerateLines { line, _ in
            lines.append(line)
        }
        
        dictionary.addObjects(from: lines)
        
        return dictionary
    }
}
