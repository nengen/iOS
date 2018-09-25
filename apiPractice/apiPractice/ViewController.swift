//
//  ViewController.swift
//  apiPractice
//
//  Created by Nils-erik Engen on 24.09.2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?id=3161732&appid=060305de4435694d756c92df5a70b07c")
        let task = URLSession.shared.dataTask(with: url!) {(data,response, error) in
            
            if error != nil{
                print(error!)
            }else{
                if let urlContent = data {
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        print(jsonResult)
                        print(jsonResult["name"]!!)
                    }catch{
                        print("Json processing failed")
                    }
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

