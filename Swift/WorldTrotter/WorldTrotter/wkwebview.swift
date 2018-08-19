//
//  wkwebview.swift
//  WorldTrotter
//
//  Created by Nils-erik Engen on 08.01.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import Foundation
import WebKit

class internetView{
    var mapView: WKWebView!

    
    override func loadView(){
        
        mapView = WKWebView
        
        view = mapView
        
        
    
    }
}
