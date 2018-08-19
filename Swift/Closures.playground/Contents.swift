//: Playground - noun: a place where people can play

import UIKit

func makeTownGRand(budget: Int, condition: Int -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget){
        func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
            return toLights + lightsToAdd
        }
        return buildRoads
    }else{
        return nil
    }
}

func evalueBudget(budget:Int) -> Bool {
    return budget > 10000
}

var stopLights = 4

if let townPlan = makeTownGRand(1000, condition: evalueBudget){
    stopLights = townPlan(4, stopLights)
}

print("Knowhere has \(stopLights) stoplights.")


