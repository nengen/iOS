//
//  autoComplete.swift
//  weatherFinder
//
//  Created by Nils-erik Engen on 25/09/2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

extension ViewController{
    
    func formatSubstring(subString: String) -> String{
        let formatted = String(subString.dropLast(autocompleteCharactersCount)).lowercased().capitalized //drop of charcters of the string according to autoCompleteCharactersCount, set it to lowercased and then capitalize it, since this is the way we will be searching for it. Alternatively: could call lowercase on all in search and then format when printing the value
        return formatted
    }
    
    //resets the variables that we use in autocomplete
    func resetValues(){
        autocompleteCharactersCount = 0
        cityTextField.text = ""
    }
    
    
    func searchAutoCompleteEntriesWithSubstring(substring: String){
        let userQuery = substring
        let suggestions = getAutoCompleteSuggestions(userText: substring) //get auto complete suggestions for the given string
        
        if suggestions.count > 0 {
            timer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: {(timer) in
                let autoCompleteResult = self.formatAutoCompleteResult(substring: substring, possibleMatches: suggestions)
                self.putColourFormattedTextInTextField(autoCompleteResult: autoCompleteResult, userQuery: userQuery) 
            })
        }else{
            timer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: {(timer) in
                self.cityTextField.text = substring
            })
            autocompleteCharactersCount = 0
        }
    }
    
    
    func getAutoCompleteSuggestions(userText: String) -> [String]{
        
        var possibleMatches: [String] = [] //init an empty array
        for item in autoCompletePossibilities { //loop thorugh possible matches
            let myString:NSString! = item as NSString //get the current item
            let substringRange: NSRange! = myString.range(of: userText) //Finds and returns the range of the first occurrence of usertext within the string.
            if(substringRange.location == 0){ //a bit unsure what this does
                possibleMatches.append(item)//append to the empty array
            }
        }
        return possibleMatches //return the arrray
    }
    
    //changes the color of auto complete text since we cant do that in the storyboard
    func putColourFormattedTextInTextField(autoCompleteResult: String, userQuery: String){
        let colouredString: NSMutableAttributedString = NSMutableAttributedString(string: userQuery + autoCompleteResult)
        colouredString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.lightGray, range: NSRange(location: userQuery.count, length: autoCompleteResult.count))
        self.cityTextField.attributedText = colouredString
    }
    
    //moves the caret to the end of what the user already has typed in, without this function it goes to the end of the autocompletesuggestion
    func moveCaretToEndUserQueryPosition(userQuery: String){
        if let newPosition = self.cityTextField.position(from:  self.cityTextField.beginningOfDocument, offset: userQuery.count){ //set newPosition to right after index of last char the user has typed
            self.cityTextField.selectedTextRange = self.cityTextField.textRange(from: newPosition, to: newPosition)//set caret to zero
        }
        let selectedRange: UITextRange? = cityTextField.selectedTextRange
        cityTextField.offset(from: cityTextField.beginningOfDocument, to: (selectedRange?.start)!)
    }
    
    //format auto complete result
    func formatAutoCompleteResult(substring: String, possibleMatches: [String]) -> String {
        var autoCompleteResult = possibleMatches[0] //set the first result to the first possible match of the possible matches array
        autoCompleteResult.removeSubrange(autoCompleteResult.startIndex..<autoCompleteResult.index(autoCompleteResult.startIndex, offsetBy: substring.count)) //remove the characters that are already typed, so we dont get duplicates
        autocompleteCharactersCount = autoCompleteResult.count //set the charcount to whats remaining of the autocompleteResult string
        return autoCompleteResult
    }
    
    
}


