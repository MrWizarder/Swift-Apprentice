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


