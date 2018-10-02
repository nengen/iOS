//
//  jsonParser.swift
//  weatherFinder
//
//  Created by Nils-erik Engen on 01/10/2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

class jsonParser{
    
    struct nameAndID: Decodable {
        let name: String
        let country: String
        let id: Int
    }

    
    func loadJson(filename fileName: String) -> [nameAndID] {
        var tempArray = [nameAndID]()
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                //let decoder = JSONDecoder()
                let jsonData = try JSONDecoder().decode([nameAndID].self, from: data)
                tempArray = jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return tempArray
    }
    
    func getCitiesAsString(json: [nameAndID])->[String]{
        var tempArray = [String]()
        for array in json{
            let stringForSearch = array.name + "," + array.country
            tempArray.append(stringForSearch)
        }

        return tempArray
    }
    
}
