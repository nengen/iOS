//
//  ViewController.swift
//  weatherFinder
//
//  Created by Nils-erik Engen on 24.09.2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource{

    
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBAction func showWeatherButton(_ sender: UIButton) {
    }
    @IBOutlet weak var showWeatherOutlet: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var autocompleteTableView: UITableView!

    var pastUrls = ["Bergen,DE", "Bergen,NO", "Bergen", "Cats", "Dogs", "Children"]
    var autocompleteUrls = [String]()
    var timer = Timer()
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       // let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        //view.addGestureRecognizer(tap)
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
        //cityTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        
        autocompleteTableView.delegate = self
        autocompleteTableView.dataSource = self
        autocompleteTableView.isScrollEnabled = true
        autocompleteTableView.allowsSelection = true
        autocompleteTableView.isUserInteractionEnabled = true
        autocompleteTableView.isHidden = true
        autocompleteTableView.layer.borderWidth = 2
        autocompleteTableView.layer.borderColor = UIColor.lightGray.cgColor
        autocompleteTableView.layer.cornerRadius = 6
        autocompleteTableView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        autocompleteTableView.backgroundColor = UIColor.clear
        cityTextField.delegate = self
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        autocompleteTableView.frame = CGRect(x: autocompleteTableView.frame.origin.x, y: autocompleteTableView.frame.origin.y, width: autocompleteTableView.frame.size.width, height: autocompleteTableView.contentSize.height)
        autocompleteTableView.backgroundColor = UIColor.clear
        

    }
    
    override func viewDidLayoutSubviews(){
        autocompleteTableView.frame = CGRect(x: autocompleteTableView.frame.origin.x, y: autocompleteTableView.frame.origin.y, width: autocompleteTableView.frame.size.width, height: autocompleteTableView.contentSize.height)
        autocompleteTableView.backgroundColor = UIColor.clear
        autocompleteTableView.reloadData()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        autocompleteTableView.isHidden = false
        showWeatherOutlet.isHidden = true
        let substring = (self.cityTextField.text! as NSString).replacingCharacters(in: range, with: string)
        
        searchAutocompleteEntriesWithSubstring(substring: substring)
        return true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autocompleteUrls.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let autoCompleteRowIdentifier = "AutoCompleteRowIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: autoCompleteRowIdentifier)
        
        if cell != nil
        {
            let index = indexPath.row as Int
            cell!.textLabel?.text = autocompleteUrls[index]
        } else
        {
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: autoCompleteRowIdentifier)
        }
        cell?.backgroundColor = UIColor.clear
        cell?.textLabel?.textColor = UIColor.white
        return cell!
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hey")
        let selectedCell : UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        cityTextField.text = selectedCell.textLabel?.text
        autocompleteTableView.isHidden = true
        view.endEditing(true)
        showWeatherOutlet.isHidden = false
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


