//
//  PhotoStore.swift
//  Photorama
//
//  Created by Nils-erik Engen on 09.09.2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

class PhotoStore {
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchRecentPhotos(){
        
        let url = FlickrAPI.recentPhotosURL()
        let request = URLRequest(url: url as URL)
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            
            if let jsonData = data {
                if let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue){
                    print(jsonString)
                }
            }else if let requestError = error{
                print("Error fetching recent photos: \(requestError)")
            }else{
                print("Unexpected error with the request")
            }
        }
        task.resume()
    }
    
    
    
}
