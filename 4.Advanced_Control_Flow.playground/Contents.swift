//: Playground - noun: a place where people can play

import UIKit

var sum = 0
rowLoop: for row in 0..<8 {
    columnLoop: for column in 0..<8 {
        if row == column {
            continue rowLoop
        }
        sum += row * column
    }
}

var sum1 = 0
for row in 0..<8 {
    for column in 0..<8 {
        if row == column {
            break
        }
        sum1 += row * column
    }
}


var sum2 = 0
for row in 0..<8 {
    if row % 2 == 0 {
        continue
    }
    for column in 0..<8 {
        sum2 += row * column
    }
}

var sum3 = 0
for row in 0..<8 where row % 2 == 1 {
    for column in 0..<8 {
        sum3 += row * column
    }
}


let string = "Dog"
switch string {
case "Cat", "Dog":
    print("Animal is a house pet.")
default:
    print("Animal is not a house pet.")
}

let hourOfDay = 12
let timeOfDay: String
switch hourOfDay {
case 0, 1, 2, 3, 4, 5:
    timeOfDay = "Early morning"
case 6, 7, 8, 9, 10, 11:
    timeOfDay = "Morning"
case 12, 13, 14, 15, 16:
    timeOfDay = "Afternoon"
case 17, 18, 19:
    timeOfDay = "Evening"
case 20, 21, 22, 23:
    timeOfDay = "Late evening"
default:
    timeOfDay = "INVALID HOUR!"
}
print(timeOfDay)

let range = 1...10


func noReturn() -> Never {
    while true {
        
    }
}




