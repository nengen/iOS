//
//  autoComplete.swift
//  weatherFinder
//
//  Created by Nils-erik Engen on 25/09/2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    func searchAutocompleteEntriesWithSubstring(substring: String)
    {
        
        autocompleteUrls.removeAll(keepingCapacity: false)

        
        for curString in pastUrls{
            let myString: NSString! = (curString  as! NSString)
            let substringRange: NSRange! = myString.range(of: substring)
            if (substringRange.location == 0)
            {
                autocompleteUrls.append(curString as! String)
            }
        }
        
        autocompleteTableView.reloadData()
    }
    
    
    func setUpAutoCompleteTableView(){
        autocompleteTableView.delegate = self
        autocompleteTableView.dataSource = self
        autocompleteTableView.isScrollEnabled = true
        autocompleteTableView.allowsSelection = true
        autocompleteTableView.isUserInteractionEnabled = true
        autocompleteTableView.isHidden = true
        autocompleteTableView.layer.borderWidth = 1
        autocompleteTableView.layer.borderColor = UIColor.lightGray.cgColor
        autocompleteTableView.layer.cornerRadius = 6
        autocompleteTableView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        autocompleteTableView.backgroundColor = UIColor.clear
        autocompleteTableView.keyboardDismissMode = .onDrag
    }
    
}
