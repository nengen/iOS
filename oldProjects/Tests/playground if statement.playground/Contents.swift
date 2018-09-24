//: Playground - noun: a place where people can play

import UIKit

for var i = 0; i <= 50; i = i+10 {

println(i)

}

var arr = [1, 2, 3, 4]


for x in arr{
    
println(x)

}

for (index, x) in enumerate(arr){

    arr[index] = x+1
    
}
println(arr)



var array = [9.0, 6.0, 1.0, 2.0,]

for (index, value) in enumerate(array){

    array[index] = array[index]/2

}
println(array)