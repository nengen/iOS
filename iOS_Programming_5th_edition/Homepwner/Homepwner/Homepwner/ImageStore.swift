//
//  ImageStore.swift
//  Homepwner
//
//  Created by Nils-erik Engen on 07.09.2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ImageStore{
    let cache = NSCache<AnyObject, AnyObject>()
    
    func setImage(image: UIImage, forKey key: String){
        cache.setObject(image, forKey: key as AnyObject)
        
        //create full URL for image
        let imageURL = imageURLForKey(key: key)
        
        //turn image into JPEG data
        if let data = UIImageJPEGRepresentation(image, 0.5){
            //Write it to full URL
            do{
                try data.write(to: imageURL as URL)
            }catch{
                print("error cant write image to disk")
            }
        }
    }
    
    func imageForKey(key: String) -> UIImage? {
        
        if let existingImage = cache.object(forKey: key as AnyObject) as? UIImage {
            return existingImage
        }
        let imageURL = imageURLForKey(key: key)
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path!) else {
            return nil
        }
        cache.setObject(imageFromDisk, forKey: key as AnyObject)
        return imageFromDisk
    }
    
    func deleteImageForKey(key: String){
        cache.removeObject(forKey: key as AnyObject)
        
        let imageURL = imageURLForKey(key: key)
        do{
            try FileManager.default.removeItem(at: imageURL as URL)
        } catch let deleteError{
            print("error, cant remove image from disk\(deleteError)")
        }
    }
    
    func imageURLForKey(key: String) -> NSURL{
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathExtension(key) as NSURL
    }
    
}



