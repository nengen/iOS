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


    var autocompleteUrls = [String]()
    var timer = Timer()
    
    
    var jsonparser = jsonParser()
    var pastUrls = [Any]()
    var allUrls = [String:[Any]]()
    var tempArr = [String: [Any]]()


    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pbTimer = ParkBenchTimer()
        
        //set background image to a picture
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "cityNight.jpg")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        backgroundImage.addBlurEffect()
        self.view.insertSubview(backgroundImage, at: 0)

        //round the corners of the button
        showWeatherOutlet.layer.cornerRadius = 4
        setUpTextField()
        setUpAutoCompleteTableView()
        allUrls = jsonparser.loadJson(filename: "alphabeticSortedJson")
        print("View did load took \(pbTimer.stop()) seconds")
        /*let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)*/
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
        //restrict autoTableView to dont go past screen
        var height = 0
        if autocompleteTableView.contentSize.height > 200{
            height = 200
        }else{
            height = Int(autocompleteTableView.contentSize.height)
        }
        autocompleteTableView.frame = CGRect(x: autocompleteTableView.frame.origin.x, y: autocompleteTableView.frame.origin.y, width: autocompleteTableView.frame.size.width, height: CGFloat(height))
        autocompleteTableView.backgroundColor = UIColor.clear
        autocompleteTableView.reloadData()
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        autocompleteTableView.isHidden = false
        showWeatherOutlet.isHidden = true
        let substring = (self.cityTextField.text! as NSString).replacingCharacters(in: range, with: string)
        if (self.cityTextField.text?.count ?? 0)>1 {

            let temp = jsonparser.getCharDict(json: allUrls as! [String : [jsonParser.nameAndID]], char: substring)
            pastUrls = jsonparser.getCitiesAsString(json: temp)
            searchAutocompleteEntriesWithSubstring(substring: substring)
        }
        return true
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if autocompleteUrls.count>15{
            return 15
        }
        return autocompleteUrls.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pbTimer = ParkBenchTimer()
        
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
        print("cellForRowAt took \(pbTimer.stop()) seconds")
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
 
    
   

    
    
    
    
}


