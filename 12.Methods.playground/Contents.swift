//: Playground - noun: a place where people can play

import UIKit

//// Method refersher

var numbers = [1, 2, 3]
numbers.removeLast()
numbers

//// Turning a function into a method

let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]
struct SimpleDate {
    var month: String
    var day: Int
    var monthsUntilWinterBreak: Int {
        return months.index(of: "December")! - months.index(of: month)!
    }
    
    init(month: String, day: Int) {
        self.month = month
        self.day = day
    }
    
//    func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
//        return months.index(of: "December")! - months.index(of: date.month)!
//    }
//    func monthsUntilWinterBreak() -> Int {
//        return months.index(of: "December")! - months.index(of: month)!
//    }
}

//let date = SimpleDate(month: "October")
let date = SimpleDate(month: "February", day: 14)
//date.monthsUntilWinterBreak(from: date)

//// Introducting self

//date.monthsUntilWinterBreak()

date.monthsUntilWinterBreak


//// Introducing initializers

//let date = SimpleDate()
date.month


//// Initializers in structures

let valentinesDay = SimpleDate(month: "February", day: 14)
valentinesDay.month
valentinesDay.day


//// Introducing mutating methods



