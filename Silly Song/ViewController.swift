//
//  ViewController.swift
//  Silly Song
//
//  Created by Arturo Reyes on 2/11/17.
//  Copyright © 2017 Arturo Reyes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func reset(_ sender: Any) {
        
        nameField.text = ""
        lyricsView.text = ""
        
    }
    
    @IBAction func diplayLyrics(_ sender: Any) {
        
        let fullName = nameField.text
        
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: fullName!)
        
    }

}

func shortNameFromName(name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowels = "aeiou"
    let vowelSet = CharacterSet(charactersIn: vowels)
    let range = lowercaseName.rangeOfCharacter(from: vowelSet, options:.caseInsensitive)
    
    

    for character in vowels.characters {
        if name.characters.contains(character) {
            let sillyName = lowercaseName.substring(from: (range?.lowerBound)!)
            return sillyName
        }
    }
    
    return lowercaseName
    
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameFromName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")



extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
