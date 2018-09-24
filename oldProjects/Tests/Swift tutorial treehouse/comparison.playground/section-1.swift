// comparison

import UIKit

var distance = 19

if distance < 5 {
    println("\(distance) miles is near")
} else if distance >= 5 && distance < 20 {
    println("\(distance) is close")
}
else {
    println("\(distance) miles is far")
}






//&& is the and operator
// || is the or operator
// ! is the not operator

if distance > 5 || distance < 20 {
    println("AND")
}
