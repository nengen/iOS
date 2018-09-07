//
//  ItemStore.swift
//  Homepwner
//
//  Created by Nils-erik Engen on 30.08.2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ItemStore{
    
    var allItems = [Item]()
    
<<<<<<< HEAD
    let itemArchiveURL: NSURL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive") as NSURL
    }()
    
=======
>>>>>>> 31201dff4c6d4e65282132d55381003b922e4049
    func createitem() -> Item{
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    func removeItem(item: Item){
        if let index = allItems.index(of: item){
            allItems.remove(at: index)
        }
    }
    
<<<<<<< HEAD
    func moveItemAtIndex(fromIndex: Int, toIndex: Int){
        if fromIndex == toIndex{
            return
        }
        //get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        //remove item from array
        allItems.remove(at: fromIndex)
        
        //insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
    
    
    func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path!)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path!)
    }
    
    init(){
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path!) as? [Item]{
            allItems += archivedItems
        }
    }
    
    
    
    
=======
>>>>>>> 31201dff4c6d4e65282132d55381003b922e4049
}
