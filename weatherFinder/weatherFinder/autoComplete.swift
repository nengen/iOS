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
        let formatted = String(subString.dropLast(autocompleteCharactersCount)).lowercased().capitalized
        return formatted
    }
    
    func resetValues(){
        autocompleteCharactersCount = 0
        cityTextField.text = ""
    }
    
    func searchAutoCompleteEntriesWithSubstring(substring: String){
        let userQuery = substring
        let suggestions = getAutoCompleteSuggestions(userText: substring)
        
        if suggestions.count > 0 {
            timer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: {(timer) in
                let autoCompleteResult = self.formatAutoCompleteResult(substring: substring, possibleMatches: suggestions)
                self.putColourFormattedTextInTextField(autoCompleteResult: autoCompleteResult, userQuery: userQuery)
                self.moveCaretToEndUserQueryPosition(userQuery: userQuery)
            })
        }else{
            timer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: {(timer) in
                self.cityTextField.text = substring
            })
            autocompleteCharactersCount = 0
        }
    }
    
    func getAutoCompleteSuggestions(userText: String) -> [String]{
        var possibleMatches: [String] = []
        for item in autoCompletePossibilities {
            let myString:NSString! = item as NSString
            let substringRange: NSRange! = myString.range(of: userText)
            
            if(substringRange.location == 0){
                possibleMatches.append(item)
            }
        }
        return possibleMatches
    }
    
    func putColourFormattedTextInTextField(autoCompleteResult: String, userQuery: String){
        let colouredString: NSMutableAttributedString = NSMutableAttributedString(string: userQuery + autoCompleteResult)
        colouredString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.lightGray, range: NSRange(location: userQuery.count, length: autoCompleteResult.count))
        self.cityTextField.attributedText = colouredString
    }
    
    func moveCaretToEndUserQueryPosition(userQuery: String){
        if let newPosition = self.cityTextField.position(from: self.cityTextField.beginningOfDocument, offset: userQuery.count){
            self.cityTextField.selectedTextRange = self.cityTextField.textRange(from: newPosition, to: newPosition)
        }
        let selectedRange: UITextRange? = cityTextField.selectedTextRange
        cityTextField.offset(from: cityTextField.beginningOfDocument, to: (selectedRange?.start)!)
    }
    
    func formatAutoCompleteResult(substring: String, possibleMatches: [String]) -> String {
        var autoCompleteResult = possibleMatches[0]
        autoCompleteResult.removeSubrange(autoCompleteResult.startIndex..<autoCompleteResult.index(autoCompleteResult.startIndex, offsetBy: substring.count))
        autocompleteCharactersCount = autoCompleteResult.count
        return autoCompleteResult
    }
    
    
}
/*
autocompleteTableView = [[UITableView alloc] initWithFrame:
    CGRectMake(0, 80, 320, 120) style:UITableViewStylePlain];
autocompleteTableView.delegate = self;
autocompleteTableView.dataSource = self;
autocompleteTableView.scrollEnabled = YES;
autocompleteTableView.hidden = YES;
[self.view addSubview:autocompleteTableView];
 */
