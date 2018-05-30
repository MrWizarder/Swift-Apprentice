//: Playground - noun: a place where people can play

import UIKit


//// Your first enumeration

let months = ["January", "February", "March", "April", "May",
              "June", "July", "August", "September", "October",
              "November", "December"]

//func semester(for month: String) -> String {
//    switch month {
//    case "August", "September", "October", "November", "December":
//        return "Autumn"
//    case "January", "February", "March", "April", "May":
//        return "Spring"
//    default:
//        return "Not in the school year"
//    }
//}
//
//semester(for: "April") // Spring


//// Declaring an enumeration

//enum Month {
//    case january
//    case february
//    case march
//    case april
//    case may
//    case june
//    case july
//    case august
//    case september
//    case october
//    case november
//    case december
//}

enum Month: Int {
    case january = 1, february, march, april, may, june, july, august, september, october, november, decimber
    var monthsUntilWinterBreak: Int {
        return Month.decimber.rawValue - self.rawValue
    }
}


//// Deciphering an enumeration in a function

//func semester(for month: Month) -> String {
//    switch month {
//    case Month.august, Month.september, Month.october, Month.november, Month.decimber:
//        return "Autumn"
//    case Month.january, Month.february, Month.march, Month.april, Month.may:
//        return "Spring"
//    default:
//        return "Not in the school year"
//    }
//}

func semester(for month: Month) -> String {
    switch month {
    case .august, .september, .october, .november, .decimber:
        return "Autumn"
    case .january, .february, .march, .april, .may:
        return "Spring"
    case .june, .july:
        return "Summer"
    }
}

var month = Month.april
semester(for: month)

month = .september
semester(for: month)


//// Code completion prevents typos

//// Raw values

//func monthsUntilWinterBreak(from month: Month) -> Int {
//    return Month.decimber.rawValue - month.rawValue
//}
//monthsUntilWinterBreak(from: .april)


//// Initializing with the raw value

let fifthMonth = Month(rawValue: 5)!
//monthsUntilWinterBreak(from: fifthMonth)
let monthsLeft = fifthMonth.monthsUntilWinterBreak


//// String raw values






