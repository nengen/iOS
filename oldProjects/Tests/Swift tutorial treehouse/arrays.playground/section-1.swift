// Playground - noun: a place where people can play

import UIKit

var todo : [String] = ["Return Calls", "Write Blogpost", "Cook Dinner"]

todo += ["Pickup Laundry", "Buy Bulbs"]

todo[2]

todo.count

todo.append("Edit Blog Post")
todo

todo[2] = "Clean Dishes"
let item = todo.removeLast()
item
let item2 = todo.removeAtIndex(1)
item2

todo.insert("Call Mom", atIndex: 0)
todo

todo.insert("fare til synne", atIndex: 0)

let synne = todo.removeAtIndex(0)

print (synne)