//: Playground - noun: a place where people can play

import UIKit
import Foundation


    
    let radius: Int
    
    let pi = 3.14
    
    func computer (radius: Int) -> (area: Int, circumference: Int){
        let radius = Double(radius)
        
        let area = radius * radius * pi
        
        let circumference = radius * 2 * pi
        
        return (Int(area), Int(circumference))
    }

    
    
    let circleFive = computer(radius: 4)
    
