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
    func createAutoCompleteTableView()->UITableView{
        let autoCompleteTableView = UITableView.init(frame: CGRect(x:0,y:80,width: 320,height:120), style: UITableViewStyle.plain)
        autoCompleteTableView.delegate = (cityTextField as! UITableViewDelegate)
        autoCompleteTableView.dataSource = (cityTextField as! UITableViewDataSource)
        autoCompleteTableView.isScrollEnabled = true
        autoCompleteTableView.isHidden = true
        self.view.addSubview(autoCompleteTableView)
        return autoCompleteTableView
    }
    
    func startAutoComplete(tableView: UITableView){
        if cityTextField.text?.count ?? 0 > 2 {
            tableView.isHidden = false
        }
    }
    
    func getSubstring(tableView: UITableView)->String{
        if tableView.isHidden == false {
            return cityTextField.text!
        }else{
            return "None"
        }
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
