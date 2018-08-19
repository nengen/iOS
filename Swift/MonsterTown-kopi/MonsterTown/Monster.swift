//
//  Monster.swift
//  MonsterTown
//
//  Created by Nils-erik Engen on 12.03.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import Foundation

class Monster{
    
    
    static let isTerrifying = true
    class var spookyNoise: String {
        return "Grr"
    }
    
    var town: Town?
    var name = "Monster"
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set (newVictimPool){
            town?.population = newVictimPool
        }
    }
    
    func terrorizeTown(){
        town?.attackType = .monster
        if town != nil {
            print("\(name) is terrorizing a town!")
        }else{
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
    
}