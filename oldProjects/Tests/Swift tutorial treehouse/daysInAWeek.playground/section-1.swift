// DaysInWeek

import UIKit

enum Day: Int {
    case Monday = 1
    case Tuesday = 2
    case Wednesday = 3
    case Thursday = 4
    case Friday = 5
    case Saturday = 6
    case Sunday = 7
} /*can be on same line without case after the first and then just use commas*/

func weekdayOrWeekend(dayOfWeek: Day) -> String{
    
    switch dayOfWeek{
    case Day.Monday, Day.Tuesday, Day.Wednesday, Day.Thursday, Day.Friday : /*Trenhe ikkje Day. foran alle, . e nok: t.d: .Monday, .Tuesday */
        return "It´s a weekday"
    case Day.Saturday, Day.Sunday:
        return "Yay! It´s the weekend!"
    default:
        return "Not a valid day"
    }
}

var today = Day.Wednesday

weekdayOrWeekend(Day.Wednesday)

