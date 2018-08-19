//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Nils-erik Engen on 18.12.2016.
//  Copyright © 2016 NorseTechnology. All rights reserved.
//

import UIKit
class ConversionViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var celsiusLabel: UILabel!
    
    var fahrenheitValue: Double? {
        didSet{
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue{
            return (value-32) * (5/9)
        }
        else{
            return nil
        }
    }
    
    func updateCelsiusLabel(){
        if let value = celsiusValue{
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value))
        }
        else{
            celsiusLabel.text = "???"
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    //this function asks the delegate if the specified text should be changed. Based on the return, which is a bool.(If statement at the bottom)
    func textField(_ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool{
        
        //Constant where the current localization of the user is stored.
        let currentLocale = Locale.current
        //Constant where the decimalseperator is stored as a string based on the localization, so either a "," or a ".". Making it universal
        let decimalseparator = (currentLocale as NSLocale).object(forKey: NSLocale.Key.decimalSeparator) as! String
        
        //checks if there is a comma, or period based on the localization of the user
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalseparator)
        
        //replacementext = the digit typed, can be more than one character if its pasted, therefore checks if there is a deicmalseparator in the new character or pasted number.
        //the string.rangeofstring is set to a value(0) as soon as one comma is pressed in the app
        let replacementTextHasDecimalSeparator = string.range(of: decimalseparator)
        
        //When the decimal is put in by the user, the replacement constant gets a value, the next time the decimal is pressed, the existing text is checked for decimals, and if there is one, both of the expresions are not equal to nil, and therefore this if statement returns false.
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil{
            print("nice")
            return false
        }
        else{
            return true
        }
    }
    
    @IBOutlet var textField: UITextField!
    
    
    //This function changes the textfield based on the input
    //The number = numberFormatter.NumberFromString(text) Takes the variable text(which is the text the user put in) and converts the string into a number. Instances of NSNumberFormatter format the textual representation of cells that contain NSNumber objects and convert textual representations of numeric values into NSNumber objects. The number formatter is aware of the locale, and converts the string into a number.
    //So this returns an instance of NSNumber, this way we can do calculations with both commas, and periods.
    @IBAction func fahrenheitFieldEditingChanged(_ textfield: UITextField) {
        if let text = textField.text, let number = numberFormatter.number(from: text){
            fahrenheitValue = number.doubleValue
        }
        else {
            fahrenheitValue = nil
        }
        
    }
    
    //Function that dismisses the keyboard
    @IBAction func dismissKeyboard(_ sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
    }
    
    

}
