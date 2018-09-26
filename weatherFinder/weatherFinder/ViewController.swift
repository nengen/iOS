//
//  ViewController.swift
//  weatherFinder
//
//  Created by Nils-erik Engen on 24.09.2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBAction func showWeatherButton(_ sender: UIButton) {
    }
    @IBOutlet weak var showWeatherOutlet: UIButton!
    @IBOutlet weak var answerLabel: UILabel!

    var autoCompletePossibilities = ["Bergen,DE", "Bergen,NO", "Cats", "Dogs", "Children"]
    var autocompleteCharactersCount = 0
    var timer = Timer()
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set background image to a picture
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "cityNight.jpg")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        //blur the background image
        backgroundImage.addBlurEffect()
        self.view.insertSubview(backgroundImage, at: 0)

        
        
        //round the corners of the button
        showWeatherOutlet.layer.cornerRadius = 4
        
        cityTextField.backgroundColor = UIColor.clear
        cityTextField.layer.borderWidth = 2
        cityTextField.layer.borderColor = UIColor.lightGray.cgColor
        cityTextField.layer.cornerRadius = 6
        cityTextField.placeholder = "Enter value"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var subString = (cityTextField.text!.capitalized as NSString).replacingCharacters(in: range, with: string)
        subString = formatSubstring(subString: subString)
        
        if subString.count == 0{
            resetValues()
        }else{
            searchAutoCompleteEntriesWithSubstring(substring: subString)
        }
        return true
        
    }
    
   
    
    
}


