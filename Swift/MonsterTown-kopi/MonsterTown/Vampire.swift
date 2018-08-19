//
//  Vampire.swift
//  MonsterTown
//
//  Created by Nils-erik Engen on 12.03.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import Foundation

class Vampire: Monster{
    
    var vampireThralls = [Vampire]()
    
    
    override func terrorizeTown() {
        town?.attackType = .vampire
        if town?.population >= 10 {
            town?.changePopulation(-10)
            vampireThralls.append(Vampire())
        }else{
            town?.population = 0
        }
    }
}