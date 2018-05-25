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
    
//    init(month: String, day: Int) {
//        self.month = month
//        self.day = day
//    }
    
    mutating func advance() {
        day += 1
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

var valentinesDay = SimpleDate(month: "February", day: 14)
valentinesDay.month
valentinesDay.day


//// Introducing mutating methods
valentinesDay.advance()


//// Type methods

struct Math {
    static func factorial(of number: Int) -> Int {
        return (1...number).reduce(1, *)
    }
}

Math.factorial(of: 6)


//// extensions

extension Math {
    static func primeFactors(of value: Int) -> [Int] {
        // 1
        var remainingValue = value
        // 2
        var testFactor = 2
        var primes: [Int] = []
        // 3
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            }
            else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        return primes
    }
}

Math.primeFactors(of: 81)


///// keeping the initializer using extensions

extension SimpleDate {
    init() {
        month = "January"
        day = 1
    }
}

//SimpleDate.init()
SimpleDate.init(month: "March", day: 2)


//// Chalenges

// 1
struct Circle {
    var radius = 0.0
    
    var area: Double {
        return .pi * radius * radius
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}
