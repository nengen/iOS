//
//  Monster.swift
//  MonsterTown
//
//  Created by Nils-erik Engen on 12.03.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import Foundation

class Monster{
    
    var town: Town?
    var name = "Monster"
    
    func terrorizeTown(){
        if town != nil {
            print("\(name) is terrorizing a town!")
        }else{
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
    
}