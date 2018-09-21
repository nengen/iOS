//
//  temperatureConverter.swift
//  MetricConverter
//
//  Created by Nils-erik Engen on 21.09.2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
class temperatureConverter {
    
    var temperatureOptions = ["celsius", "fahrenheit"]
    
    func calculateLength(fromOption: String, toOption: String, fromValue: Double) -> Double{
        switch (fromOption, toOption) {
        case ("celsius", "fahrenheot"):
            return fromValue*1.8+32.0
        case ("fahrenheit", "celsius"):
            return (fromValue-32.0)*0.5556
            
        default:
            print("Error, no case found")
        }
        //If nothing is found return 0.00
        return 0.00
    }
    
    
    
}
