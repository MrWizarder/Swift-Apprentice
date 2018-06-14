//: Playground - noun: a place where people can play

import UIKit



//// Optional pattern

let names: [String?] = ["Michelle", nil, "Brandon", "Christine", nil, "David"]
for case let name? in names {
    print(name)
}


//// "Is" type-casting pattern


let array: [Any] = [15, "George", 2.0]

for element in array {
    switch element {
    case is String:
        print("Found a string")
    default:
        print("Found something else")
    }
}


//// "As" type-casting pattern

for element in array {
    switch element {
    case let text as String:
        print("Found a string: \(text)")
    default:
        print("Found something else")
    }
}



//// Advanced patterns

//// Qualifying with where

for number in 1...9 {
    switch number {
    case let x where x % 2 == 0:
        print("even")
    default:
        print("odd")
    }
}


enum LevelStatus {
    case complete
    case inProgress(percent: Double)
    case notStarted
}

let levels: [LevelStatus] = [.complete, .inProgress(percent: 0.9), .notStarted ]

for level in levels {
    switch level {
    case .inProgress(let percent) where percent > 0.8 :
        print("Almost there!")
    case .inProgress(let percent) where percent > 0.5 :
        print("Halfway there!")
    case .inProgress(let percent) where percent > 0.2 :
        print("Made it through the beginning!")
    default:
        break
    }
}




//// Chaining with commas

func timeOfDayDescription(hour: Int) -> String {
    switch hour {
    case 0, 1, 2, 3, 4, 5:
        return "Early morning"
    case 6, 7, 8, 9, 10, 11:
        return "Morning"
    case 12, 13, 14, 15, 16:
        return "Afternoon"
    case 17, 18, 19:
        return "Evening"
    case 20, 21, 22, 23:
        return "Late evening"
    default:
        return "INVALID HOUR!"
    }
}
let timeOfDay = timeOfDayDescription(hour: 12)


//if case .animal(let legs) = pet, case 2...4 = legs {
//    print("potentially cuddly")
//} else {
//    print("no chance for cuddles")
//}


enum Number {
    case integerValue(Int)
    case doubleValue(Double)
    case booleanValue(Bool)
}

let a = 5
let b = 6
let c: Number? = .integerValue(7)
let d: Number? = .integerValue(8)

if a != b {
    if let c = c {
        if let d = d {
            if case .integerValue(let cValue) = c {
                if case .integerValue(let dValue) = d {
                    if dValue > cValue {
                        print("a and b are different")
                        print("d is greater than c")
                        print("sum: \(a + b + cValue + dValue)")
                    }
                }
            }
        }
    }
}



if a != b,
    let c = c,
    let d = d,
    case .integerValue(let cValue) = c,
    case .integerValue(let dValue) = d,
    dValue > cValue {
    print("a and b are different")
    print("d is greater than c")
    print("sum: \(a + b + cValue + dValue)")
}
