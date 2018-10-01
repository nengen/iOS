//
//  keyboard.swift
//  weatherFinder
//
//  Created by Nils-erik Engen on 30/09/2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    func pickUp(_ textField : UITextField){
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    
    //these three functions do almost the same, replace them with one?
    
    //close picker
    @objc func doneClick(){
        view.endEditing(true)
        showWeatherOutlet.isHidden = false
        autocompleteTableView.isHidden = true
    }
    
    //close picker
    @objc func cancelClick(){
        cityTextField.text = ""
        view.endEditing(true)
        showWeatherOutlet.isHidden = false
        autocompleteTableView.isHidden = true
    }
    

    
    /*@objc func dismissKeyboard() {
        view.endEditing(true)
        showWeatherOutlet.isHidden = false
        autocompleteTableView.isHidden = true

    }*/
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        pickUp(textField)
    }
}
