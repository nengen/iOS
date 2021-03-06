//
//  jsonParser.swift
//  weatherFinder
//
//  Created by Nils-erik Engen on 01/10/2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

class jsonParser{
    
    struct desc: Decodable{
        let key: [nameAndID]
        
    }
    
    struct nameAndID: Decodable {
        let name: String
        let country: String
        let id: Int
    }
    
    

    //parses a json file and retrieves the info specified in nameAndID struct using Decodable
    //To access it we call the loadJson on an empty array, then we loop through it to retrieve
    //the parts of the structs we want
    func loadJson(filename fileName: String) -> [String: [nameAndID]] {
        var myDict = [String:[nameAndID]]()
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                //let decoder = JSONDecoder()
                let jsonData = try JSONDecoder().decode([String:[nameAndID]].self, from: data)
                myDict = jsonData
            } catch {
                print("error:\(error)")
            }
        }
      
        return myDict
    }
    
    func getCharDict(json: [String: [nameAndID]], char: String) -> [nameAndID]{
        var temp = [nameAndID]()
        for array in json{
            if array.key.lowercased() == char.prefix(1).lowercased() {
                for values in array.value{
                    temp.append(values)
                }
            }
        }
        return temp
    }
    
    
    func getCitiesAsString(json: [nameAndID])->[String]{
        var tempArray = [String]()
        for array in json{
            
            let stringForSearch = array.name.lowercased().capitalized + "," + array.country
            tempArray.append(stringForSearch)
        }

        return tempArray
    }
    
    func getIdFromJson(json: [String: [nameAndID]], city: String) -> Int {
        var result = 0
        for array in json{
            if array.key.first == city.first {
                for values in array.value{
                    let string = values.name + "," + values.country
                    if city == string{
                        result = values.id
                    }
                }
            }
        }
        return result
    }
    
    
 
    
}
//583509
