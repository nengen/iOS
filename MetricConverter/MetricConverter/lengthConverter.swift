//
//  lengthConverter.swift
//  MetricConverter
//
//  Created by Nils-erik Engen on 21.09.2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
class lengthConverter {
    
    var lengthOptions = ["foot", "inch", "meter", "centimeter"]
    
    func calculateLength(fromOption: String, toOption: String, fromValue: Double) -> Double{
        switch (fromOption, toOption) {
        case ("foot", "meter"):
            return fromValue*0.31622776602
        case ("foot", "centimeter"):
            return fromValue*31.622776602
        case ("inch", "meter"):
            return fromValue*0.0254
        case ("inch", "centimeter"):
            return fromValue*2.54
        case ("meter", "foot"):
            return fromValue/0.31622776602
        case ("meter", "inch"):
            return fromValue/0.0254
        case ("centimeter", "foot"):
            return fromValue/31.622776602
        case ("centimeter", "inch"):
            return fromValue/2.54
        
        default:
            print("Error, no case found")
        }
        //If nothing is found return 0.00
        return 0.00
    }
    
    
    
}
