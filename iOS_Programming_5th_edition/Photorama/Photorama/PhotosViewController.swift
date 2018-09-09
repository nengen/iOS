//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Nils-erik Engen on 09.09.2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchRecentPhotos()
    }
    
}


