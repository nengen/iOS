//
//  ItemStore.swift
//  Homepwner
//
//  Created by Nils-erik Engen on 30.01.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import UIKit

class ItemStore{

    var allItems = [Item]()
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    //functions that creates and returns a new item
    func createItem() -> Item{
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(_ item: Item){
        if let index = allItems.index(of: item){
        allItems.remove(at: index)
        }
    }
    
    func moveItemAtIndex(_ fromIndex:Int, toIndex: Int){
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
        print("Saving items to: \(itemArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
    }
    
    init(){
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Item] {
            allItems += archivedItems
        }
    }
    
    
}
