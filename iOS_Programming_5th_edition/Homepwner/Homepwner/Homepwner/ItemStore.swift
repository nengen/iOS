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
    
}
