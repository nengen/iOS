//
//  weightConverter.swift
//  MetricConverter
//
//  Created by Nils-erik Engen on 21.09.2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

class weightConverter{

 var weightOptions = ["Kilograms", "Grams", "Ounce", "Pound", "Stone"]
    
    //Consider using variables instead of constants
    func calculateWeight(fromOption: String, toOption: String, fromValue: Double) -> Double{
        switch (fromOption, toOption) {
        case ("Kilograms", "Ounce"):
            return Double(fromValue*1000/28)
        case ("Kilograms", "Pound"):
            return (fromValue/0.45359237)
        case ("Kilograms", "Stone"):
            return fromValue/6.35029318
        case ("Grams", "Ounce"):
            return Double(fromValue/28)
        case ("Grams", "Pound"):
            return (fromValue/453.59237)
        case ("Grams", "Stone"):
            return (fromValue/6350.29138)
        case ("Ounce", "Kilograms"):
            return Double(28*fromValue/1000)
        case ("Ounce", "Grams"):
            return Double(28*fromValue)
        case ("Pound", "Kilograms"):
            return fromValue*0.45359237
        case ("Pound", "Grams"):
            return fromValue*453.59237
        case ("Stone", "Kilograms"):
            return fromValue*6.35029318
        case ("Stone", "Grams"):
            return fromValue*6350.29138
        default:
            print("Error, no case found")
        }
        //If nothing is found return 0.00
        return 0.00
    }


}
