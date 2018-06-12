//: Playground - noun: a place where people can play

import UIKit

//// Custom operators

infix operator **

//func **(base: Int, power: Int) -> Int {
//    precondition(power >= 2)
//    var result = base
//    for _ in 2...power {
//        result *= base
//    }
//    return result
//}
//
//let base = 2
let exponent = 2
//let result = base ** exponent


//// Compound assignment operator


infix operator **=

//func **=(lhs: inout Int, rhs: Int) {
//    lhs = lhs ** rhs
//}
//
//var number = 2
//number **= exponent


//// Generic operators

func **<T: BinaryInteger>(base: T, power: Int) -> T {
    precondition(power >= 2)
    var result = base
    for _ in 2...power {
        result *= base
    }
    return result
}

func **=<T: BinaryInteger>(lhs: inout T, rhs: Int) {
    lhs = lhs ** rhs
}


let unsignedBase: UInt = 2
let unsignedResult = unsignedBase ** exponent

let base8: Int8 = 2
let result8 = base8 ** exponent

let unsignedBase8: UInt8 = 2
let unsignedResult8 = unsignedBase8 ** exponent

let base16: Int16 = 2
let result16 = base16 ** exponent

let unsignedBase16: UInt16 = 2
let unsignedResult16 = unsignedBase16 ** exponent

let base32: Int32 = 2
let result32 = base32 ** exponent

let unsignedBase32: UInt32 = 2
let unsignedResult32 = unsignedBase32 ** exponent

let base64: Int64 = 2
let result64 = base64 ** exponent

let unsignedBase64: UInt64 = 2
let unsignedResult64 = unsignedBase64 ** exponent



//// Precedence and associativity

precedencegroup ExponentiationPrecedence {
associativity: right
higherThan: MultiplicationPrecedence
}

//infix operator **: ExponentiationPrecedence









//// Subscripts

//subscript(parameterList) -> ReturnType {
//    get {
//        // return someValue of ReturnType
//    }
//
//    set(newValue) {
//        // set someValue of ReturnType to newValue
//    }
//}


class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let me = Person(name: "Cosmin", age: 31)

extension Person {
    subscript(key: String) -> String? {
        switch key {
        case "name":
            return name
        case "age":
            return "\(age)"
        default:
            return nil
        }
    }
}

me["name"]
me["age"]
me["gender"]

//// Subscript parameters

extension Person {
    subscript(key key: String) -> String? {
        switch key {
        case "name":
            return name
        case "age":
            return "\(age)"
        default:
            return nil
        }
    }
}

me[key: "name"]
me[key: "age"]
me[key: "gender"]


extension Person {
    subscript(property key: String) -> String? {
        switch key {
        case "name":
            return name
        case "age":
            return "\(age)"
        default:
            return nil
        }
    }
}

me[property: "name"]
me[property: "age"]
me[property: "gender"]






//// Keypaths

class Tutorial {
    let title: String
    let author: Person
    let type: String
    let publishDate: Date
    
    init(title: String, author: Person, type: String, publishDate: Date) {
        self.title = title
        self.author = author
        self.type = type
        self.publishDate = publishDate
    }
}

let tutorial = Tutorial(title: "Object Oriented Programming in Swift", author: me, type: "Swift", publishDate: Date())

let title = \Tutorial.title
let tutorialTitle = tutorial[keyPath: title]

let authorName = \Tutorial.author.name
var tutorialAuthor = tutorial[keyPath: authorName]


//// Appending keypaths

let authorPath = \Tutorial.author
let authorNamePath = authorPath.appending(path: \.name)
tutorialAuthor = tutorial[keyPath: authorNamePath]


//// Setting properties

class Jukebox {
    var song: String
    
    init(song: String) {
        self.song = song
    }
}

let jukebox = Jukebox(song: "Nothing else matters")

let song = \Jukebox.song
jukebox[keyPath: song] = "Stairway to heaven"



//// Challenges

// 1
extension Array {
    subscript(index: Int) -> (String, String)? {
        get {
        guard let value = self[index] as? Int else {
            return nil
        }
        
        switch (value >= 0, abs(value)%2) {
        case (true, 0):
            return ("positive", "even")
        case (true: 1):
            return ("positive", "odd")
        case (false, 0):
            return ("negative", "even")
        case (false, 1):
            return ("negative", "odd")
        default:
            return nil
        }
        }
    }
}


