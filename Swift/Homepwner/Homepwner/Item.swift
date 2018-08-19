//
//  Item.swift
//  Homepwner
//
//  Created by Nils-erik Engen on 23.01.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import UIKit


//Item inherits from NSObject.
class Item: NSObject, NSCoding{
    
    var name: String
    var valueInDollars: Int
    var serialNumber: String? //necessary with an optional because an item may not have a serial number
    let dateCreated: Date
    let itemKey: String
    
    
    //Designated initializer on the Item class, sets the initial values for all of the properties
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        self.itemKey = UUID().uuidString
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random{ //if random equals true, configure with a random name, serial number and value
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count)) //random adjective position
            let randomAdjective = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count)) //random noun position
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name:randomName,
                      serialNumber: randomSerialNumber,
                      valueInDollars: randomValue)
        }
            else{
                self.init(name: "", serialNumber: nil, valueInDollars: 0)
            }
        
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(dateCreated, forKey: "dateCreated")
        aCoder.encode(itemKey, forKey: "itemKey")
        aCoder.encode(serialNumber, forKey: "serialNumber")
        
        aCoder.encode(valueInDollars, forKey: "valueInDollars")
    }
    
    required init(coder aDecoder:NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        itemKey = aDecoder.decodeObject(forKey: "itemKey") as! String
        serialNumber = (aDecoder.decodeObject(forKey: "serialNumber") as! String)
        
        valueInDollars = aDecoder.decodeInteger(forKey: "valueInDollars")
        
        super.init()
        
    }
}
