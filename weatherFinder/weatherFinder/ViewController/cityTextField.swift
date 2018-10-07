//
//  cityTextField.swift
//  weatherFinder
//
//  Created by Nils-erik Engen on 07/10/2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import UIKit
extension ViewController{
    
    func setUpTextField(){
    cityTextField.backgroundColor = UIColor.clear
    cityTextField.layer.borderWidth = 2
    cityTextField.layer.borderColor = UIColor.lightGray.cgColor
    cityTextField.layer.cornerRadius = 6
    cityTextField.placeholder = "Enter value"
    cityTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    
    cityTextField.delegate = self
    }
    
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if cityTextField.text!.count == 0{
            autocompleteTableView.isHidden = true
            cityTextField.layer.cornerRadius = 6
            print("empty")
        }else{
            autocompleteTableView.isHidden = false
            cityTextField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
}
