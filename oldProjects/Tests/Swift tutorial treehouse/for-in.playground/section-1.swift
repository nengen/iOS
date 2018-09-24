// For-in

import UIKit

var todo: [String] = ["Return calls", "Write blog", "Cook dinner", "Pickup Laundry", "Buy bulbs"]

println(todo[0])
println(todo[1])
println(todo[3])

for item in todo{
    println(item)
}

for number in 1...10 {
    println("\(number) times 2 is \(number*2)")
}