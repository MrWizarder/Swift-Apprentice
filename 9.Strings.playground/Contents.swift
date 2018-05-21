//: Playground - noun: a place where people can play

import UIKit

let string = "Matt"
for char in string {
    print(char)
}

let stringLength = string.count
//let fourthChat = string[3]

let cafeNormal = "café"
let cafeCombining = "cafe\u{0301}"
cafeNormal.count
cafeCombining.count

cafeNormal.unicodeScalars.count
cafeCombining.unicodeScalars.count

for codePoint in cafeCombining.unicodeScalars {
    print(codePoint.value)
}

let firstIndex = cafeCombining.startIndex
let firstChar = cafeCombining[firstIndex]
//let lastIndex = cafeCombining.endIndex
//let lastChar = cafeCombining[lastIndex]
let lastIndex = cafeCombining.index(before: cafeCombining.endIndex)
let lastChar = cafeCombining[lastIndex]

let fourthIndex = cafeCombining.index(cafeCombining.startIndex, offsetBy: 3)
let fourthChar = cafeCombining[fourthIndex]

firstChar.unicodeScalars.count
fourthChar.unicodeScalars.count
fourthChar.unicodeScalars.forEach() { codePoint in
    print("codePoint \(codePoint.value)")
}

let equal = cafeNormal == cafeCombining

let name = "Matt"
let backwardsName = name.reversed()

let secondCharIndex = backwardsName.index(backwardsName.startIndex, offsetBy: 1)
let secondChar = backwardsName[secondCharIndex]

let backwardsNameString = String(backwardsName)


let fullName = "Matt Galloway"
let spaceIndex = fullName.index(of: " ")!
//let firstName = fullName[fullName.startIndex..<spaceIndex]
let firstNmae = fullName[..<spaceIndex]
let lastName = fullName[fullName.index(after: spaceIndex)...]
let lastNameString = String(lastName)


let char = "\u{00bd}"
for i in char.utf8 {
    print(i)
}

let characters = "+\u{00bd}\u{21e8}\u{1f643}"
for i in characters.utf8 {
    print("\(i): \(String(i, radix: 2))")
}
for i in characters.utf16 {
    print("\(i): \(String(i, radix: 2))")
}

print("####\n")

let string1 = "this;because;thar is ; not"
string1.components(separatedBy: ";")



let arrowIndex = characters.index(of: "\u{21e8}")!
characters[arrowIndex]

if let unicodeScalarsIndex = arrowIndex.samePosition(in: characters.unicodeScalars) {
    characters.unicodeScalars[unicodeScalarsIndex]
}
if let utf8Index = arrowIndex.samePosition(in: characters.utf8) {
    characters.utf8[utf8Index]
}
if let utf16Index = arrowIndex.samePosition(in: characters.utf16) {
    characters.utf16[utf16Index]
}


let letters = "abracadabra"
let letterCount = letters.reduce(into: [:]) { counts, letter in
    counts[letter, default: 0] += 1
}

func stringCount(_ string: String) {
    
    let dic = string.reduce(into: [:]) {(result, chars: Character) in
        
        return result[chars, default: 0] += 1
    }
    print(dic)
}

stringCount("liuwangisatshenzhen")








