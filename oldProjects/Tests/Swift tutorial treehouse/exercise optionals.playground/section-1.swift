// Exercise

import UIKit

func isDivisible (#dividend: Int, #divisor: Int) ->Bool? {
    if dividend % divisor == 0 {
        return true
    } else {
        return nil
    }
}

if let result = isDivisible(dividend: 15, divisor: 3){

    println("Divisible")
} else {
    println("Not Divisible")
}