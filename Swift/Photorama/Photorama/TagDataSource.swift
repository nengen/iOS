//
//  TagDataSource.swift
//  Photorama
//
//  Created by Nils-erik Engen on 03.03.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import UIKit
import CoreData
class TagDataSource: NSObject, UITableViewDataSource {
    var tags: [NSManagedObject] = []
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        let tag = tags[indexPath.row]
        let name = tag.valueForKey("name") as! String
        cell.textLabel?.text = name
        
        return cell
    }
    
}
