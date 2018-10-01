//
//  autoComplete.swift
//  weatherFinder
//
//  Created by Nils-erik Engen on 25/09/2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

extension ViewController{
    func searchAutocompleteEntriesWithSubstring(substring: String)
    {
        autocompleteUrls.removeAll(keepingCapacity: false)
        
        for curString in pastUrls
        {
            print(curString)
            let myString: NSString! = curString as NSString
            let substringRange: NSRange! = myString.range(of: substring)
            if (substringRange.location == 0)
            {
                autocompleteUrls.append(curString)
            }
        }
        
        autocompleteTableView.reloadData()
    }
}
