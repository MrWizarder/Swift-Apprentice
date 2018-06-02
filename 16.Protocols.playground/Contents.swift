//: Playground - noun: a place where people can play

import UIKit



//// Introducing protocols

protocol Vehicle {
    func accelerate()
    func stop()
}


//// Protocol syntax

class Unicycle: Vehicle {
    var peddling = false
    
    func accelerate() {
        peddling = true
    }
    
    func stop() {
        peddling = false
    }
}

//// Methods in protocols

enum Direction {
    case left
    case right
}

protocol DirectionalVehicle {
    func accelerate()
    func stop()
    func turn(_ direction: Direction)
    func description() -> String
}

protocol OptionalDirectionVehicle {
//    func trun(_ direction: Direction = .left)
    func turn()
    func turn(_ direction: Direction)
}

//// Properties in protocols

protocol VehicleProperties {
    var weight: Int { get }
    var name: String { get set }
}

//// Initializers in protocols

protocol Account {
    var value: Double { get set }
    init(initialAmount: Double)
    init?(transferAccount: Account)
}

class BitcoinAccount: Account {
    var value: Double
    required init(initialAmount: Double) {
        value = initialAmount
    }
    required init?(transferAccount: Account) {
        guard transferAccount.value > 0.0 else {
            return nil
        }
        value = transferAccount.value
    }
}

var accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 30.00)
let transferAccount = accountType.init(transferAccount: account)!


//// Protocol inheritance

protocol WheeledVehicle: Vehicle {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}

protocol Area {
    var area: Double { get }
}


//// Implementing protocols

//class Bike: Vehicle {
//    var peddling = false
//    var brakesAplied = false
//
//    func accelerate() {
//        peddling = true
//        brakesAplied = false
//    }
//
//    func stop() {
//        peddling = false
//        brakesAplied = true
//    }
//}

//// Implementing properties

//class Bike: WheeledVehicle {
//
//    let numberOfWheels: Int = 2
//    var wheelSize: Double = 16.0
//
//    var peddling = false
//    var brakesAplied = false
//
//    func accelerate() {
//        peddling = true
//        brakesAplied = false
//    }
//
//    func stop() {
//        peddling = false
//        brakesAplied = true
//    }
//}


//// Associated types in protocols

protocol WeightCalculatable {
    associatedtype WeightType
    var weight: WeightType { get }
}

class HeavyThing: WeightCalculatable {
    typealias WeightType = Int
    
    var weight: Int {
        return 100
    }
}

class LightThing: WeightCalculatable {
    typealias WeightType = Double
    
    var weight: Double {
        return 0.0025
    }
}

//// Implementing multiple protocols

protocol Wheeled {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}

class Bike: Vehicle, Wheeled {
    
    let numberOfWheels: Int = 2
    var wheelSize: Double = 16.0
    
    var peddling = false
    var brakesAplied = false
    
    func accelerate() {
        peddling = true
        brakesAplied = false
    }
    
    func stop() {
        peddling = false
        brakesAplied = true
    }
}

//// Protocol Composition

func roundAndRound(transportation: Vehicle & Wheeled) {
    transportation.stop()
    print("The brakes are being applied to \(transportation.numberOfWheels) wheels")
}

roundAndRound(transportation: Bike())


//// Extensions and protocol conformance

protocol Reflective {
    var typeName: String { get }
}

extension String: Reflective {
    var typeName: String {
        return "I'm a String"
    }
}

let title = "Swift Apprentice!"
title.typeName


class AnotherBike: Wheeled {
    var peddling = false
    let numberOfWheels: Int = 2
    var wheelSize: Double = 16
}

extension AnotherBike: Vehicle {
    func accelerate() {
        peddling = true
    }
    
    func stop() {
        peddling = false
    }
}


//// Requiring reference semantics

protocol Named {
    var name: String { get set }
}

class ClassyName: Named {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct StructyName: Named {
    var name: String
}


var named: Named = ClassyName(name: "Classy")
var copy = named

named.name = "Still Classy"
named.name
copy.name

named = StructyName(name: "Structy")
copy = named

named.name = "Still Structy?"
named.name
copy.name


//// Protocols: more than bags of syntax

//// Protocols in the standard library

let a = 5
let b = 5
a == b

let swiftA = "Swift"
let swiftB = "Swift"
swiftA == swiftB

struct Record {
    var wins: Int
    var losses: Int
}

let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)
//recordA == recordB


protocol Equatable {
    static func ==(lhs: Self, rhs: Self) -> Bool
}

extension Record: Equatable {
    static func ==(lhs: Record, rhs: Record) -> Bool {
        return lhs.wins == rhs.wins &&
            lhs.losses == rhs.losses
    }
}
recordA == recordB


//// Comparable

protocol Comparable: Equatable {
    static func <(lhs: Self, rhs: Self) -> Bool
}

extension Record: Comparable {
    static func <(lhs: Record, rhs: Record) -> Bool {
        if lhs.wins == rhs.wins {
            return lhs.losses > rhs.losses
        }
        return lhs.wins < rhs.wins
    }
    static func <=(lhs: Record, rhs: Record) -> Bool {
        return lhs < rhs || lhs == rhs
    }
}

//// Free functions

let teamA = Record(wins: 14, losses: 11)
let teamB = Record(wins: 23, losses: 8)
let teamC = Record(wins: 23, losses: 9)
var leagueRecords = [teamA, teamB, teamC]

//leagueRecords.sort()
//leagueRecords.max()


//// Other useful protocols




