//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Nils-erik Engen on 23.01.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    var imageStore: ImageStore!
    
    @IBAction func addNewItem(_ sender: AnyObject){
        //create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        //Figure out where that item is in the array
        if let index = itemStore.allItems.index(of: newItem){
            let indexPath = IndexPath(row: index, section: 0)
            
            //insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        //Update the labels for the new preferred text size
        cell.updateLabels()
        
        
        
        //set the text on the cell with the description of the item
        //that is at the nth index of items, where n = row this cell
        //will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        
        //Configure the cell with the Item
        
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "$\(item.valueInDollars)"
        //update the text color
        cell.updateTextColor(item.valueInDollars)
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the height of the cell equal to the default value which is uitableviewautomaticdimension
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //If the table view is asking to committ a delete command..
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            //set the warning title
            let title = "Remove \(item.name)?"
            //set the warning message
            let message = "Are you sure you want to delete this item?"
            //make a AlertController containing the title and message.
            let ac = UIAlertController(title:title, message: message, preferredStyle: .actionSheet)
            
            //make a cancelAction for the alertController
            let cancelAction = UIAlertAction(title:"Cancel", style: .cancel, handler: nil)
            //add the cancelAction to the alertController
            ac.addAction(cancelAction)
            //Make a delete action for the alertController which deletes the selected row
            let deleteAction = UIAlertAction(title: "Remove", style: .destructive, handler: {(action) -> Void in
            
            //remove the item from the store, (the removeItem is a function from the ItemStore.swift)
            self.itemStore.removeItem(item)
                
            //Remove the item's image from the image store
                self.imageStore.deleteImageForKey(item.itemKey)
            
            //also remove that row from the table view with an animation
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            })
            //add the deleteAction to the alertController
            ac.addAction(deleteAction)
            
            //present the alert controller
            present(ac, animated: true, completion: nil)
        }
       
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        //update the model
        itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //If the triggered segue is the "ShowItem" segue
        if segue.identifier == "ShowItem" {
            
            //Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                //Get the item associated with this row and pass it along
                let item = itemStore.allItems[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.item = item
                detailViewController.imageStore = imageStore
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
}
