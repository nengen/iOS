//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Nils-erik Engen on 30.08.2018.
//  Copyright © 2018 None. All rights reserved.
<<<<<<< HEAD
//Learn what delegation, datasource, MVC and target-action-pair is
=======
//
>>>>>>> 31201dff4c6d4e65282132d55381003b922e4049

import UIKit

class ItemsViewController: UITableViewController{
    var itemStore: ItemStore!
<<<<<<< HEAD
    var imageStore: ImageStore!
=======
>>>>>>> 31201dff4c6d4e65282132d55381003b922e4049
    
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
<<<<<<< HEAD

=======
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
>>>>>>> 31201dff4c6d4e65282132d55381003b922e4049
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //get a new or recycled cell
<<<<<<< HEAD
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        //Update the labels for the new preferred text size
        cell.updateLabels()
=======
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
>>>>>>> 31201dff4c6d4e65282132d55381003b922e4049
        
        //set the text on the cell with the description of the item
        //that is the nth index of items, where n = row this cell
        //will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
<<<<<<< HEAD
        
        //configure the cell with the Item
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "$\(item.valueInDollars)"
        cell.changeValueLabelFont(value: item.valueInDollars)
        
=======
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
>>>>>>> 31201dff4c6d4e65282132d55381003b922e4049
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
<<<<<<< HEAD
        
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
=======
        //get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
>>>>>>> 31201dff4c6d4e65282132d55381003b922e4049
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle : UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        //if the table view is asking to commit a delete command
        if editingStyle == .delete{
            let item = itemStore.allItems[indexPath.row]
<<<<<<< HEAD
            
            let title = "Delete\(item.name)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac  = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style : .destructive, handler: {(action) -> Void in
            
                //remove the item from the store
                self.itemStore.removeItem(item: item)
                
                //remove the items image from the image store
                self.imageStore.deleteImageForKey(key: item.itemKey)
                
                //Also remove that row from the table view with an animation
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            //press the alert controller
            present(ac, animated: true,completion:nil)
            
            
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        //update the model
        itemStore.moveItemAtIndex(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //If the triggered segue is the showitem segue
        if segue.identifier == "ShowItem"{
            //figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row{
                //get the item associated with this row and pass it along
                let item = itemStore.allItems[row]
                let detailVievController = segue.destination as! DetailViewController
                detailVievController.item = item
                detailVievController.imageStore = imageStore
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
=======
            //remove the item from the store
            itemStore.removeItem(item: item)
            
            //Also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
    
>>>>>>> 31201dff4c6d4e65282132d55381003b922e4049
    
    
    
    
}
