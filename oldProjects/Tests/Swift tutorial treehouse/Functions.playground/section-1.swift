//Functions
import UIKit

println("Swift functions")


func calculateArea(height: Int, width: Int ) ->Int {
    return height * width
}

println("Area = \(calculateArea(10, 12))")

calculateArea(10, 5)





//Extraaaaaaaaaaaaaaaaaa

/* Write a function called fullName which takes two string parameters: firstName and lastName. It concatenates the two parameters and returns them as the fullName*/

func fullName(firstName: String, lastName: String) ->String{
    return firstName + " " + lastName
}
fullName("Nils-Erik", "Engen")

fullName("Synne", "Bakke Almestad")