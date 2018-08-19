//
//  Mayor.swift
//  MonsterTown
//
//  Created by Nils-erik Engen on 13.03.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import Foundation

struct Mayor {
    
    private var anxietyLevel: Int = 0
    
    mutating func populationDecreaseStatement(forAttackType type: Town.AttackType){
        print("I'm deeply saddened to hear about this latest tragedy. I promise that my office is looking into the nature of this rash of violence")
        if type == Town.AttackType.zombie {
            anxietyLevel += 1
            print(anxietyLevel)
        }
    }
    
    
}