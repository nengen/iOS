//
//  Town.swift
//  MonsterTown
//
//  Created by Nils-erik Engen on 10.03.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import Foundation

struct Town {
    
    var mayor = Mayor()
    static let region = "South"
    var population = 5422{
        didSet(oldPopulation) {
            if population < oldPopulation{
            print("The population has changed to \(population) from \(oldPopulation).")
                mayor.populationDecreaseStatement(forAttackType: attackType)
            }
        }
    }
    var numberOfStoplights = 4
    
    func printTownDescription(){
        print("Population:\(population), number of stoplights:\(numberOfStoplights)")
    }
 
    var attackType:AttackType = .monster
    
    enum AttackType {
        case monster
        case zombie
        case vampire
    }
    
    
    
    enum Size{
        case Small
        case Medium
        case Large
    }
    
    var townsize: Size {
        get {
                switch self.population {
            case 0...10000:
                return Size.Small
                case 10001...100000:
                    return Size.Medium
                default:
                    return Size.Large
            }
        }
    }
    
    mutating func changePopulation(amount: Int){
        population += amount
    }
}
