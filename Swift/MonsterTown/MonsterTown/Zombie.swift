//
//  Zombie.swift
//  MonsterTown
//
//  Created by Nils-erik Engen on 12.03.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import Foundation

//Zombie inherits from Monster so it has access to the same functions and variables
class Zombie: Monster{
    var walksWithLimp = true
    
    //Override the superclasses function terrorizeTown
    final override func terrorizeTown() {
        if town?.population >= 10{
            town?.changePopulation(-10)
            //Super is a prefix used to access a superclass's implementation of a method
            super.terrorizeTown()}
        else{
            town?.population = 0
        }
    }
    func changeName(name: String, walksWithLimp: Bool){
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
}