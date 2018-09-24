// Dictionary

import UIKit

// Code Country Name

//or

//Key  Value
/* Ca   Canada
BE  Belgium
FR  France
DE  Germany
UK  United Kingdom
US  United States*/

var countries = ["CA" : "Canada", "BE" : "Belgium",
    "FR" : "France", "DE" : "Germany"]

countries["FR"]

countries["US"] = "United States"

countries

countries ["US"] = "United States of America"

countries

countries.removeValueForKey("FR")

let item = countries.removeValueForKey("CA")

item