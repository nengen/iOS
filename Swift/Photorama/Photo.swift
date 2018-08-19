//
//  Photo.swift
//  Photorama
//
//  Created by Nils-erik Engen on 03.03.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import UIKit
import CoreData


class Photo: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    var image: UIImage?
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        //Give the properties their initial values
        title = ""
        photoID = ""
        remoteURL = NSURL()
        photoKey = NSUUID().UUIDString
        dateTaken = NSDate()
    }
    
    func addTagObject(tag: NSManagedObject){
        let currentTags = mutableSetValueForKey("tags")
        currentTags.addObject(tag)
    }
    func removeTagObject(tag: NSManagedObject){
        let currentTags = mutableSetValueForKey("tags")
        currentTags.removeObject(tag)
    }
}
