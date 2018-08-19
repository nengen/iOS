//
//  main.swift
//  MonsterTown
//
//  Created by Nils-erik Engen on 10.03.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import Foundation

var myTown = Town()
let ts = myTown.townsize
print(ts)
myTown.printTownDescription()
let gm = Monster()
gm.town = myTown
gm.terrorizeTown()
let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()
fredTheZombie.changeName("Fred The Zombie", walksWithLimp: false)
print("Victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print("Victim pool: \(fredTheZombie.victimPool)")
print(Zombie.spookyNoise)
if Zombie.isTerrifying{
    print("Run Away ")
}