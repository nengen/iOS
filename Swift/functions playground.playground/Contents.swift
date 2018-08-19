//: Playground - noun: a place where people can play

import UIKit
import Foundation
import Darwin

let a:Int
let b:Int
let c:Int


func abcFunction(a: Int, b:Int, c:Int) -> (Double, Double){
    let a = Double(a)
    let b = Double(b)
    let c = Double(c)
    
    let bArg = (-b)
    let b2_4ac = (b * b - (4 * a * c))
    let divider = (2 * a)
    let squareRoot = sqrt(b2_4ac)
    
    let firstPossibility = (bArg + squareRoot)/divider
    let secondPossibility = (bArg - (squareRoot))/divider
    
    return (firstPossibility, secondPossibility)
}

let result = abcFunction(a: 1, b: -5, c: 6)

print(result)
