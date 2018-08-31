//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Nils-erik Engen on 30.08.2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController{
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(sender: AnyObject){
        //Create a new item and add it to the store
        let newItem = itemStore.createitem()
        
        //Figure out where that item is in the arrat
        if let index = itemStore.allItems.index(of: newItem){
            let indexPath = NSIndexPath(item: index, section: 0)
            
            //Insert this new row into the table
            tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
        }


    }
    @IBAction func toogleEditingMode(sender: AnyObject){
        //if you are currently in editing mode
        if isEditing{
            //change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            
            //Turn off editing mode
            setEditing(false, animated: true)
        }else{
            //change the text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            //Enter editing mode
            setEditing(true, animated: true)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        //set the text on the cell with the description of the item
        //that is the nth index of items, where n = row this cell
        //will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle : UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        //if the table view is asking to commit a delete command
        if editingStyle == .delete{
            let item = itemStore.allItems[indexPath.row]
            //remove the item from the store
            itemStore.removeItem(item: item)
            
            //Also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
    
    
    
    
    
}
