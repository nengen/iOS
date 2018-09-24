// Enum Methods or Member Functions

import UIKit

enum Day: Int {
    case Monday = 1, Tuesday , Wednesday, Thursday , Friday, Saturday, Sunday

    func daysTillWeekend() -> Int {
        return Day.Saturday.rawValue - self.rawValue
    }

}


var today = Day.Monday
today.daysTillWeekend()

today = .Friday

today.daysTillWeekend()

var holiday = Day.Saturday
holiday.daysTillWeekend()






