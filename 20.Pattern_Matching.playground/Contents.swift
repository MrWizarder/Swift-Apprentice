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

func process(point: (x: Int, y: Int, z: Int)) -> String {
    guard case(0, 0, 0) = point else {
        return "Not at origin"
    }
    return "At origin"
}

let point = (x: 0, y: 0, z: 0)
let response = process(point: point)



//// switch


