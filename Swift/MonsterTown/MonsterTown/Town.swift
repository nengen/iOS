//
//  Town.swift
//  MonsterTown
//
//  Created by Nils-erik Engen on 10.03.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import Foundation

struct Town {
    
    var population = 9
    var numberOfStoplights = 4
    
    func printTownDescription(){
        print("Population:\(population), number of stoplights:\(numberOfStoplights)")
    }
 
    mutating func changePopulation(amount: Int){
        population += amount
    }
}
