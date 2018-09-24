// Struct - Default Values

import UIKit

struct Contact{
    let firstName : String
    let lastName : String
    var type: String = "Friend"
}

var person = Contact(firstName: "Jon", lastName: "Smith", type:"Friend")