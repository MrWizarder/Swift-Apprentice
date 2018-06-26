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


// 1

private class Pixels {
    let storageBuffer: UnsafeMutableBufferPointer<UInt8>
    
    init(size: Int, value: UInt8) {
        let p = UnsafeMutablePointer<UInt8>.allocate(capacity: size)
        storageBuffer = UnsafeMutableBufferPointer<UInt8>(start: p, count: size)
        storageBuffer.initialize(from: repeatElement(value, count: size))
    }
    
    init(pixels: Pixels) {
        let otherStorage = pixels.storageBuffer
        let p = UnsafeMutablePointer<UInt8>.allocate(capacity: otherStorage.count)
        storageBuffer = UnsafeMutableBufferPointer<UInt8>(start: p, count: otherStorage.count)
        storageBuffer.initialize(from: otherStorage)
    }
    
    subscript(offset: Int) -> UInt8 {
        get {
            return storageBuffer[offset]
        }
        set {
            storageBuffer[offset] = newValue
        }
    }
    
    deinit {
        storageBuffer.baseAddress!.deallocate(capacity: self.storageBuffer.count)
    }
}

//var image1 = Image(width: 4, height: 4, value: 0)
//
//// test setting and getting
//image1[0,0] // -> 0
//image1[0,0] = 100
//image1[0,0] // -> 100
//image1[1,1] // -> 0
//// copy
//var image2 = image1
//image2[0,0] // -> 100
//image1[0,0] = 2
//image1[0,0] // -> 2
//image2[0,0] // -> 100 because of copy-on-write
//var image3 = image2
//image3.clear(with: 255)
//image3[0,0] // -> 255
//image2[0,0] // -> 100 thanks again, copy-on-write


// 2


// 3


