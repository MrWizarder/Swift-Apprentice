//: Playground - noun: a place where people can play

import UIKit

let coordinate = (x: 1, y: 0, z: 0)

if (coordinate.y == 0) && (coordinate.z == 0) {
    print("along the x-axis")
}

if case (_, 0, 0) = coordinate {
    print("along the x-axis")
}


//// Introducing patterns


//// Basic pattern matching

//// if and guard

//func process(point: (x: Int, y: Int, z: Int)) -> String {
//    if case(0, 0, 0) = point {
//        return "At origin"
//    }
//    return "Not at origin"
//}

//func process(point: (x: Int, y: Int, z: Int)) -> String {
//    guard case(0, 0, 0) = point else {
//        return "Not at origin"
//    }
//    return "At origin"
//}

//let point = (x: 0, y: 0, z: 0)
//let response = process(point: point)



//// switch

func process(point: (x: Int, y: Int, z: Int)) -> String {
    // 1
    let closeRange = -2...2
    let midRange = -5...5
    // 2
    switch point {
    case (0, 0, 0):
        return "At origin"
    case (closeRange, closeRange, closeRange):
        return "Very close to origin"
    case (midRange, midRange, midRange):
        return "Nearby origin"
    default:
        return "Not near origin"
    }
}

let point = (x: 15, y: 5, z: 3)
let response = process(point: point)


func population(people: Int) -> String {
    guard people > 0 else {
        return "Invalid people"
    }
    let single = 1
    let fewRange = 2...10
    let severalRange = 11...100
    switch people {
    case 0:
        return "There's no people"
    case single:
        return "single people"
    case fewRange:
        return "a few people"
    case severalRange:
        return "several people"
    default:
        return "many people"
    }
}

population(people: -1)
population(people: 1)
population(people: 5)
population(people: 50)
population(people: 1000)


//// for

let groupSize = [1, 5, 4, 6, 2, 1, 3]
for case 1 in groupSize {
    print("Found an individual")
}



//// Patterns

//// Wildcard pattern

if case (_, 0, 0) = coordinate {
    print("On the x-axis")
}

//// Value-binding pattern

if case (let x, 0, 0) = coordinate {
    print("On the x-axis at \(x)")
}

if case let (x, y, 0) = coordinate {
    print("On the x-y plane at (\(x), \(y))")
}

//// identifier pattern
//(something, 0, 0)   (identifier, expression, expression).

//// Tuple pattern

//// Enumeration case pattern

enum Direction {
    case north, south, east, west
}

let heading = Direction.north
if case .north = heading {
    print("Don't forget your jacket")
}


enum Organism {
    case plant
    case animal(legs: Int)
}

let pet = Organism.animal(legs: 4)

switch pet {
case .animal(let legs):
    print("Potentially cuddly with \(legs) legs")
default:
    print("No chance for cuddles")
}


let names: [String?] = ["Michelle", nil, "Brandon", "Christine", nil, "David"]
for name in names {
    switch name {
    case .some(let result):
        print("result")
    case .none:
        print("has no name")
    }
}



//// Optional pattern

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



//// Custom tuple

let name = "Bob"
let age = 23

if case ("Bob", 23) = (name, age) {
    print("Found the right Bob!")
}


var username: String?
var password: String?

switch (username, password) {
case let (username?, password?):
    print("Success! User: \(username) Pass: \(password)")
case let (username?, nil):
    print("Password is missing. User: \(username)")
case let (nil, password?):
    print("Username is missing. Pass: \(password)")
case (nil, nil):
    print("Both username and password are missing")
}


//// Fun with wildcards

//// Do something multiple times
for _ in 1...3 {
    print("hi")
}

//// Validate that an optional exists
let user: String? = "Bob"
guard let _ = user else {
    print("There is no user.")
    fatalError()
}
print("User exists, but identity not needed.")

guard user != nil else {
    print("There is no user.")
    fatalError()
}





