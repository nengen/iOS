//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Nils-erik Engen on 22.08.2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet var celsiusLabel: UILabel!
    
    var fahrenheitValue: Double? {
        didSet{
            updateCelsiusLabel();
        }
    }
    
    var celsiusValue: Double?{
        if let value = fahrenheitValue{
            return(value - 32) * (5/9)
        }else{
            return nil
        }
    }
    
    @IBOutlet var textField: UITextField!
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField){
        if let text = textField.text, let value = Double(text){
            fahrenheitValue = value
        }else{
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender:AnyObject){
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel(){
        if let value = celsiusValue{
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: value))
        }else{
            celsiusLabel.text = "???"
        }
    }

    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool{
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDcimalSeparator = string.range(of: ".")
        let charactersNotAllowed = NSCharacterSet.letters
        let replacementTextHasCharactersNotAllowed = string.rangeOfCharacter(from: charactersNotAllowed)
        
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDcimalSeparator != nil{
            return false
        }else if replacementTextHasCharactersNotAllowed != nil{
            return false
        }else{
            return true
        }
        
    }
    
    
}
