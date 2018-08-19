//
//  ImageStore.swift
//  Homepwner
//
//  Created by Nils-erik Engen on 28.02.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import UIKit

class ImageStore{
    
    let cache = NSCache<AnyObject, AnyObject>()
    
    func setImage(_ image: UIImage, forKey key: String){
        cache.setObject(image, forKey: key as AnyObject)
        
        //Create full URL for image
        let imageURL = imageURLForKey(key)
        
        //Turn image into JPEG data
        if let data = UIImageJPEGRepresentation(image, 0.5){
            //Write it to full URL
            try? data.write(to: imageURL, options: [.atomic])
        }
    }
    
    
    func imageForKey(_ key: String) -> UIImage? {
        if let existingImage = cache.object(forKey: key as AnyObject) as? UIImage {
            return existingImage
        }
        let imageURL = imageURLForKey(key)
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path) else{
            return nil
        }
        cache.setObject(imageFromDisk, forKey: key as AnyObject)
        return imageFromDisk
    }
    
    
    func deleteImageForKey(_ key: String){
        cache.removeObject(forKey: key as AnyObject)
        
        let imageURL = imageURLForKey(key)
        do{
            try FileManager.default.removeItem(at: imageURL)
        }catch let deleteError{
            print("Error removing the image from disk: \(deleteError)")
        }
    }
    
    
    func imageURLForKey(_ key: String) -> URL{
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory.appendingPathComponent(key)
    }

}
