//
//  ViewController.swift
//  MetricConverter
//
//  Created by Nils-erik Engen on 09.09.2018.
//  Copyright © 2018 None. All rights reserved.
//
//TODO: fix error handling and make a nicer UI



import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{
    
    
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var fromTxtPick: UITextField!
    @IBOutlet weak var toTxtPick: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    var myPickerView : UIPickerView!
    
    var weight = weightConverter()
    var length = lengthConverter()
    var temperature = temperatureConverter()
    
    @IBAction func weightButton(_ sender: UIBarButtonItem) {
        pickOptions = weight.weightOptions
        currentConverter = "weight"
    }
    @IBAction func lengthButton(_ sender: UIBarButtonItem) {
        pickOptions = length.lengthOptions
        currentConverter = "length"
    }
    @IBAction func temperatureButton(_ sender: UIBarButtonItem) {
        pickOptions = temperature.temperatureOptions
        currentConverter = "temperature"
    }

    @IBAction func convertButoon(_ sender: UIButton) {
        if pickOptions == weight.weightOptions{
            getFromValue()
            let finalValue = weight.calculateWeight(fromOption: fromPickedOption!, toOption: toPickedOption!, fromValue: fromValue!)
            answerLabel.text = ("\(fromValue ?? 0.00) \(fromPickedOption ?? "error") is \(round(finalValue)) \(toPickedOption ?? "0.00")" )
        } else if pickOptions == length.lengthOptions{
            let finalValue = length.calculateLength(fromOption: fromPickedOption!, toOption: toPickedOption!, fromValue: fromValue!)
            answerLabel.text = ("\(fromValue ?? 0.00) \(fromPickedOption ?? "error") is \(round(finalValue)) \(toPickedOption ?? "0.00")" )
        } else if pickOptions == temperature.temperatureOptions{
            let finalValue = length.calculateLength(fromOption: fromPickedOption!, toOption: toPickedOption!, fromValue: fromValue!)
            answerLabel.text = ("\(fromValue ?? 0.00) \(fromPickedOption ?? "error") is \(round(finalValue)) \(toPickedOption ?? "0.00")" )
    }
    }
    
    


    
    
    var pickOptions = ["Kilograms", "Grams", "Ounce", "Pound", "Stone"]
    var fromPickedOption: String?
    var fromValue:Double?
    var toPickedOption: String?
    var currentConverter: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func pickUp(_ textField : UITextField){
        // UIPickerView
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
        textField.inputView = self.myPickerView
        
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
    
    //Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Delegate
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOptions.count
    }
    //Set the title for row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOptions[row]
    }
    
    //Get the currentSelection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if fromTxtPick.isFirstResponder {
            self.fromTxtPick.text = pickOptions[row]
            fromPickedOption = pickOptions[row]
        } else if toTxtPick.isFirstResponder{
            self.toTxtPick.text = pickOptions[row]
            toPickedOption = pickOptions[row]
        }
    }
    
    //Call the method pickup to make pickerview with bar buttons if textfield is touched
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == fromTxtPick {
            self.pickUp(fromTxtPick)
        }else if textField == toTxtPick{
            self.pickUp(toTxtPick)
        }
    }
    
    //close picker
    @objc func doneClick(){
        if(fromTxtPick.isFirstResponder){
            fromTxtPick.resignFirstResponder()
        }else if(toTxtPick.isFirstResponder){
            toTxtPick.resignFirstResponder()
        }
    }
    
    //close picker
    @objc func cancelClick(){
        if(fromTxtPick.isFirstResponder){
            fromTxtPick.resignFirstResponder()
        }else if(toTxtPick.isFirstResponder){
            toTxtPick.resignFirstResponder()
        }
    }
    
    func getFromValue(){
        if let temp = fromTextField.text, let am = Double(temp){
            fromValue = am
        }else{
            print("error")
        }
    }
    
    
    
}

