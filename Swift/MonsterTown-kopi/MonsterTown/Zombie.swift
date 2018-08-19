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
    
    override class var spookyNoise: String{
        return "Brains..."
    }
    
    var walksWithLimp = true
    private(set) var isFallingApart = false
    
    //Override the superclasses function terrorizeTown
    final override func terrorizeTown() {
        town?.attackType = .zombie
        if town?.population >= 10 && !isFallingApart {
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