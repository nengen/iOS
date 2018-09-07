//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Nils-erik Engen on 30.08.2018.
//  Copyright © 2018 None. All rights reserved.
//Learn what delegation, datasource, MVC and target-action-pair is

import UIKit

class ItemsViewController: UITableViewController{
    var itemStore: ItemStore!
    var imageStore: ImageStore!
    
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

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        //Update the labels for the new preferred text size
        cell.updateLabels()
        
        //set the text on the cell with the description of the item
        //that is the nth index of items, where n = row this cell
        //will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        
        //configure the cell with the Item
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "$\(item.valueInDollars)"
        cell.changeValueLabelFont(value: item.valueInDollars)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle : UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        //if the table view is asking to commit a delete command
        if editingStyle == .delete{
            let item = itemStore.allItems[indexPath.row]
            
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
    
    
    
    
}
