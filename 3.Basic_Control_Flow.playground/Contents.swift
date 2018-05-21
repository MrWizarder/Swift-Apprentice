//: Playground - noun: a place where people can play

import UIKit


let doesOneEqualTwo = (1 == 2)
let and = true && true

let guess = "dog"
let dogEqualsCat = guess == "cat"
let order = "cat" < "dog"

let myAge = 27
let isTeenager = myAge >= 13 && myAge < 19
let reader = "liuwang"
let author = "Matt Galloway"
let authorIsReader = reader == author

if 2 > 1 {
    print("Yes, 2 is greater than 1.")
}

let animal = "Fox"

if animal == "Cat" || animal == "Dog" {
    print("Animal is a house pet.")
} else {
    print("Animal is not a house pet.")
}

let hourOfDay = 12
let timeOfDay: String

if hourOfDay < 6 {
    timeOfDay = "Early morning"
} else if hourOfDay < 12 {
    timeOfDay = "Morning"
} else if hourOfDay < 17 {
    timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
    timeOfDay = "Evening"
} else if hourOfDay < 24 {
    timeOfDay = "Late evening"
} else {
    timeOfDay = "INVALID HOUR!"
}
print(timeOfDay)

let x1: Int
x1 = 3
let x2: String
x2 = "hello"

