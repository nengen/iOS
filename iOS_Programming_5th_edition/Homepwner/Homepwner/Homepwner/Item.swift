//
//  Item.swift
//  Homepwner
//
//  Created by Nils-erik Engen on 30.08.2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

<<<<<<< HEAD
class Item: NSObject, NSCoding {
=======
class Item: NSObject {
>>>>>>> 31201dff4c6d4e65282132d55381003b922e4049
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: NSDate
<<<<<<< HEAD
    let itemKey: String
=======
>>>>>>> 31201dff4c6d4e65282132d55381003b922e4049
    
    init(name: String, serialNumber: String?, valueInDollars: Int){
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = NSDate()
<<<<<<< HEAD
        self.itemKey = UUID().uuidString
=======
>>>>>>> 31201dff4c6d4e65282132d55381003b922e4049
        
        super.init()
    }
    
    convenience init(random: Bool = false){
        if random{
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomvalue = Int(arc4random_uniform(100))
            let randomSerialNumber = NSUUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomvalue)
        }else{
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
    }
    
<<<<<<< HEAD
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(dateCreated, forKey: "dateCreated")
        aCoder.encode(itemKey, forKey: "itemKey")
        aCoder.encode(serialNumber, forKey: "serialnumber")
        
        aCoder.encodeCInt(Int32(valueInDollars), forKey: "valueInDollars")
    }
    
    required init(coder aDecoder: NSCoder){
        name = aDecoder.decodeObject(forKey: "name") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! NSDate
        itemKey = aDecoder.decodeObject(forKey: "itemKey") as! String
        serialNumber = (aDecoder.decodeObject(forKey: "serialNumber") as! String?)
        
        valueInDollars = aDecoder.decodeInteger(forKey: "valueInDollars")
        super.init()
        
    }
    
    
    
    
    
=======
>>>>>>> 31201dff4c6d4e65282132d55381003b922e4049
}
