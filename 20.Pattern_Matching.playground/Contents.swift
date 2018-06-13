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



