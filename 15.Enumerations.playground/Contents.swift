//: Playground - noun: a place where people can play

import UIKit


//// Your first enumeration

let months = ["January", "February", "March", "April", "May",
              "June", "July", "August", "September", "October",
              "November", "December"]

//func semester(for month: String) -> String {
//    switch month {
//    case "August", "September", "October", "November", "December":
//        return "Autumn"
//    case "January", "February", "March", "April", "May":
//        return "Spring"
//    default:
//        return "Not in the school year"
//    }
//}
//
//semester(for: "April") // Spring


//// Declaring an enumeration

//enum Month {
//    case january
//    case february
//    case march
//    case april
//    case may
//    case june
//    case july
//    case august
//    case september
//    case october
//    case november
//    case december
//}

enum Month: Int {
    case january = 1, february, march, april, may, june, july, august, september, october, november, decimber
    var monthsUntilWinterBreak: Int {
        return Month.decimber.rawValue - self.rawValue
    }
}


//// Deciphering an enumeration in a function

//func semester(for month: Month) -> String {
//    switch month {
//    case Month.august, Month.september, Month.october, Month.november, Month.decimber:
//        return "Autumn"
//    case Month.january, Month.february, Month.march, Month.april, Month.may:
//        return "Spring"
//    default:
//        return "Not in the school year"
//    }
//}

func semester(for month: Month) -> String {
    switch month {
    case .august, .september, .october, .november, .decimber:
        return "Autumn"
    case .january, .february, .march, .april, .may:
        return "Spring"
    case .june, .july:
        return "Summer"
    }
}

var month = Month.april
semester(for: month)

month = .september
semester(for: month)


//// Code completion prevents typos

//// Raw values

//func monthsUntilWinterBreak(from month: Month) -> Int {
//    return Month.decimber.rawValue - month.rawValue
//}
//monthsUntilWinterBreak(from: .april)


//// Initializing with the raw value

let fifthMonth = Month(rawValue: 5)!
//monthsUntilWinterBreak(from: fifthMonth)
let monthsLeft = fifthMonth.monthsUntilWinterBreak


//// String raw values

// 1
enum Icon: String {
    case music
    case sports
    case weather
    
    var filename: String {
        return "\(rawValue).png"
    }
}

let icon = Icon.weather
icon.filename


//// Unordered raw values

enum Coin: Int {
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
}

let coin = Coin.quarter
coin.rawValue


//// Associated values

var balance = 100
//func withdraw(amount: Int) {
//    balance -= amount
//}

enum WithdrawResult {
    case success(newBalance: Int)
    case error(message: String)
}

func withdraw(amount: Int) -> WithdrawResult {
    if amount <= balance {
        balance -= amount
        return .success(newBalance: balance)
    } else {
        return .error(message: "Not enough money!")
    }
}

let result = withdraw(amount: 99)

switch result {
case .success(let newBalance):
    print("Your new balance is: \(newBalance)")
case .error(let message):
    print(message)
}


enum HTTPMethod {
    case get
    case post(body: String)
}

let request = HTTPMethod.post(body: "Hi there")
guard case .post(let body) = request else {
    fatalError("No message was posted")
}
print(body)


//// Enumeration as state machine

enum TrafficLight {
    case red, yellow, green
}
let trafficLight = TrafficLight.red

enum HouseholdLight {
    case on, off
}
let householdLight = HouseholdLight.on


//// Case-less enumerations

enum Math {
    static func factorial(of number: Int) -> Int {
        return (1...number).reduce(1, *)
    }
}
let factorial = Math.factorial(of: 6)

//let math = Math()


//// Optionals

var age: Int?
age = 17
age = nil

switch age {
case .none:
    print("No value")
case .some(let value):
    print("Got a value: \(value)")
}


let optionalNil: Int? = .none
optionalNil == nil
optionalNil == .none


//// Challenges

// 1
let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime,
                         .quarter]

coinPurse.reduce(0) { x, y in
    return x + y.rawValue
}

// 2




