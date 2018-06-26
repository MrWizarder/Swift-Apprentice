//: Playground - noun: a place where people can play

import UIKit



//// Value Types vs. reference types


//// Reference types

// assign-by-reference.

struct Color: CustomStringConvertible {
    var red, green, blue: Double
    
    var description: String {
        return "r: \(red) g: \(green) b: \(blue)"
    }
}

// Preset colors
extension Color {
    static var black = Color(red: 0, green: 0, blue: 0)
    static var white = Color(red: 1, green: 1, blue: 1)
    static var blue = Color(red: 0, green: 0, blue: 1)
    static var green = Color(red: 0, green: 1, blue: 0)
}

// Paint bucket abstraction
class Bucket {
    var color: Color
    var isRefilled = false
    
    init(color: Color) {
        self.color = color
    }
    
    func refill() {
        isRefilled = true
    }
}


let azurePaint = Bucket(color: .blue)
let wallBluePaint = azurePaint
wallBluePaint.isRefilled
azurePaint.refill()
wallBluePaint.isRefilled



//// Value types

// assign-by-copy


extension Color {
    mutating func darken() {
        red *= 0.9; green *= 0.9; blue *= 0.9
    }
}

var azure = Color.blue
var wallBlue = azure
azure
wallBlue.darken()
azure



//// Defining value semantics


//var x = MysteryType()
//var y = x
//exposeValue(x) // => initial value derived from x
//// {code here which uses only y}
//exposeValue(x) // => final value derived from x
//// Q: are the initial and final values different?



//// When to prefer value semantics





//// Implementing value semantics

//// Case 1. Primitive value types

//// Case 2. Composite value types

//// Case 3. Reference types

//var a = UIImage(named:"smile.jpg")
//var b = a
//computeValue(b)
//doSomething(a)
//computeValue(b)


//// case4. Value types containing mutable reference types

struct PaintingPlan {   // a value type, containing ...
    // a value type
    var accent = Color.white
    // a mutable reference type
    private var bucket = Bucket(color: .blue)
    
    // a pseudo-value type, using the deep storage
    // a computed property facade over deep storage
    // with copy-on-write and in-place mutation when possible
    var bucketColor: Color {
        get {
            return bucket.color
        }
        set {
            if isKnownUniquelyReferenced(&bucket) {
                bucket.color = bucketColor
            } else {
                bucket = Bucket(color: newValue)
            }
        }
    }
}

var artPlan = PaintingPlan()
var housePlan = artPlan
//artPlan.bucket.color
//housePlan.bucket.color = Color.green
//artPlan.bucket.color

//// Copy-on-write to the rescue

artPlan.bucketColor
housePlan.bucketColor = .green
artPlan.bucketColor



//// Beyond copy-on-write

func mightModify(x: inout Int, addRun f: () -> ()) { }
var i: Int = 0



//// Recipes for value semantics






//// Challenges


