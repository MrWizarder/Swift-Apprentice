//: Playground - noun: a place where people can play

import UIKit

let parsedInt = Int("dog")

var result: Int? = 30


var authorName: String? = "Matt Galloway"
var authorAge: Int? = 30

var unwrappedAuthorName = authorName!
print("Author is \(unwrappedAuthorName)")

if let unwrappedAuthorName = authorName {
    print("Author is \(unwrappedAuthorName)")
} else {
    print("No author.")
}

if let authorName = authorName {
    print("Author is \(authorName)")
} else {
    print("No author.")
}

if let authorName = authorName,
    let authorAge = authorAge,
    authorAge >= 40 {
    print("The author is \(authorName) who is \(authorAge) years old.")
} else {
    print("No author or no age or age less than 40.")
}

var myFavoriteSong: String? = nil
if let myFavoriteSong = myFavoriteSong {
    print("my Favorite Song is \(myFavoriteSong)")
} else {
    print("no song")
}


func calculateNumberOfSides(shape: String) -> Int? {
    switch shape {
    case "Triangle":
        return 3
    case "Square":
        return 4
    case "Rectangle":
        return 5
    case "Pentagon":
        return 4
    case "Hexagon":
        return 6
    default:
        return nil
    }
}

func maybePrintSides(shape: String) {
    let sides = calculateNumberOfSides(shape: shape)
    
    if let sides = sides {
        print("A \(shape) has \(sides) sides.")
    } else {
        print("I don't know the number of sides for \(shape).")
    }
}

func maybePrintSides1(shape: String) {
    guard let sides = calculateNumberOfSides(shape: shape) else {
        print("I don't know the number of sides for \(shape).")
        return
    }
    
    print("A \(shape) has \(sides) sides.")
}







