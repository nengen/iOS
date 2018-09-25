//
//  ViewController.swift
//  weatherFinder
//
//  Created by Nils-erik Engen on 24.09.2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBAction func showWeatherButton(_ sender: UIButton) {
    }
    @IBOutlet weak var showWeatherOutlet: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    let autoCompleteTableView = UITableView.init(frame: CGRect(x:0,y:80,width: 320,height:120), style: UITableViewStyle.plain)
    var pastUrls = ["Men", "Women", "Cats", "Dogs", "Children"]
    var autocompleteUrls = [String]()
    
    
    

    
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
        
        
        
        //autoComplete
        autoCompleteTableView.delegate = self
        autoCompleteTableView.dataSource = self
        autoCompleteTableView.isScrollEnabled = true
        autoCompleteTableView.isHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func searchAutocompleteEntriesWithSubstring(substring: String)
    {
        autocompleteUrls.removeAll(keepingCapacity: false)
        
        for curString in pastUrls
        {
            let myString:NSString! = curString as NSString
            
            let substringRange :NSRange! = myString.range(of: substring)
            
            if (substringRange.location  == 0)
            {
                autocompleteUrls.append(curString)
            }
        }
        
        autoCompleteTableView.reloadData()
    }
    
    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool
    {
        autoCompleteTableView.isHidden = false
        let substring = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        searchAutocompleteEntriesWithSubstring(substring: substring)
        return true     // not sure about this - could be false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autocompleteUrls.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let autoCompleteRowIdentifier = "AutoCompleteRowIdentifier"
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: autoCompleteRowIdentifier, for: indexPath as IndexPath) as UITableViewCell
        let index = indexPath.row as Int
        
        cell.textLabel!.text = autocompleteUrls[index]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell : UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        textField.text = selectedCell.textLabel.text
    }
    
    
    
}


