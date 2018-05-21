//: Playground - noun: a place where people can play

import UIKit

struct Contact {
    var fullName: String
    let emailAddress: String
    var type = "Friend"
}

var person = Contact(fullName: "Grace Murray",
                     emailAddress: "grace@navy.mil",
                     type: "Friend")

let name = person.fullName
let email = person.emailAddress

person.fullName = "Grace Hopper"
let grace = person.fullName
//person.emailAddress = "grace@gmail.com"


struct TV {
    var height: Double
    var width: Double
    
    var diagonal: Int {
        // 1
        get {
            // 2
            let result = (height * height + width * width).squareRoot().rounded()
            return Int(result)
        }
        set {
            // 3
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            // 4
            let ratioDiagonal = (ratioWidth * ratioWidth + ratioHeight * ratioHeight).squareRoot()
            height = Double(newValue) * ratioHeight / ratioDiagonal
            width = height * ratioWidth / ratioHeight
        }
    }
}

var tv = TV(height: 53.93, width: 95.87)
let size = tv.diagonal
tv.width = tv.height
let diagonal = tv.diagonal

tv.diagonal = 70
let height = tv.height
let width = tv.width

//// type properties
struct Level {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool {
        didSet {
            if unlocked && id > Level.highestLevel {
                Level.highestLevel = id
            }
        }
    }
}

let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)

//let highestLevel = level3.highestLevel
let highestLevel = Level.highestLevel


//// property observers


//// Limiting a variable
struct LightBulb {
    static let maxCurrent = 40
    var current = 0 {
        willSet {
            if newValue > LightBulb.maxCurrent {
                print("the current newValue to high, still the oldValue")
                
            }
        }
        didSet {
            if current > LightBulb.maxCurrent {
                print("Current too high, falling back to previous setting.")
                current = oldValue
            }
        }
    }
}

var light = LightBulb()
light.current = 50
var current = light.current
light.current = 40
current = light.current


//// Lazy properties
struct Circle {
//    lazy var pi = {
//        return ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
//    }()
    var radius = 0.0
    var circumference: Double {
        get {
            return Double.pi * radius * 2
        }
    }
//    init(radius: Double) {
//        self.radius = radius
//    }
}

var circle = Circle(radius: 5)
let circumference = circle.circumference



//// Challenges
// 1
struct IceCream {
    var name = "yili"
    lazy var ingredients = {
        return ["ice", "cream", "cholo"]
    }()
    init(name: String) {
        self.name = name
    }
}

var ice = IceCream(name: "mengniu")
ice.ingredients

// 2
struct FuelTank {
    var level: Double
    var lowFuel: Bool
    
}



