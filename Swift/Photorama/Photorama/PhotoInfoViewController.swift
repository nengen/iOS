//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Nils-erik Engen on 03.03.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var photo: Photo! {
        didSet{
            navigationItem.title = photo.title
        }
    }
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchImageForPhoto(photo){ (result) -> Void in
            switch result{
            case let .Success(image):
                NSOperationQueue.mainQueue().addOperationWithBlock(){
                    self.imageView.image = image
                }
            case let .Failure(error):
                print("Error fetching image for photo:\(error)")
            }
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowTags"{
            let navController = segue.destinationViewController as! UINavigationController
            let tagController = navController.topViewController as! TagsViewController
            
            tagController.store = store
            tagController.photo = photo
        }
    }
}
