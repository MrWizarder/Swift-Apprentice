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






