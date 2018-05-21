//: Playground - noun: a place where people can play

import UIKit

var integer: Int = 100
var decimal: Double = 12.5
integer = Int(decimal)

let hourlyRate: Double = 19.5
let hoursWorked: Int = 10
let totalCost: Double = hourlyRate * Double(hoursWorked)

let typeInferredInt = 42

let wantADouble = 3.0

let age1 = 42
let age2 = 21

let avg1 = (Double(age1) + Double(age2)) / 2

var message = "Hello" + " my name is "
let name = "Matt"
message += name

let exclamationMark: Character = "!"
message += String(exclamationMark)

message = "Hello my name is \(name)!"

let oneThird = 1.0 / 3.0
let oneThirdLongString = "One third is \(oneThird) as a decimal."

let bigString = """
    You can have a string
    that contains multiple
    lines
    by
    doing this.
    """

let coordinates: (Int, Int) = (2, 3)
let coordinatesDoubles = (2.1, 3.5)
let coordinatesMixed = (2.1, 3)

let x1 = coordinates.0
let y1 = coordinates.1

let coordinatesNamed = (x: 2, y: 3)
let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y
let z2 = coordinatesNamed.1


let coordinates3D = (x:2, y:3, z:1)
let (x3, y3, z3) = coordinates3D

let(x4, y4, _) = coordinates3D

let temperature = (month: 32.2, day: 35.3, year: 21.3)

let coordinates1 = ("two", "three")
let tuple = (day: 15, month: 8, year: 2015)

let number = 10
let multiplier = 5
let summary = "\(number) multiplied by \(multiplier) equals \(number * multiplier)"

Double.pi
Float.pi

