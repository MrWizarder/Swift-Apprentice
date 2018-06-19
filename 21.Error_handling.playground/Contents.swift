//: Playground - noun: a place where people can play

import UIKit



//// First level error handling with optionals

//// Failable initializers

let value = Int("3")
let failedValue = Int("nope")

enum PetFood: String {
    case kibble, canned
}

let morning = PetFood(rawValue: "kibble")
let snack = PetFood(rawValue: "fuud!")


struct PetHouse {
    let squareFeet: Int
    
    init?(squareFeet: Int) {
        if squareFeet < 1 {
            return nil
        }
        self.squareFeet = squareFeet
    }
}

let tooSmall = PetHouse(squareFeet: 0)
let house = PetHouse(squareFeet: 1)


//// Optional Chaining

//class Pet {
//    var breed: String?
//
//    init(breed: String? = nil) {
//        self.breed = breed
//    }
//}
//
//class Person {
//    let pet: Pet
//
//    init(pet: Pet) {
//        self.pet = pet
//    }
//}
//
//let delia = Pet(breed: "pug")
//let olive = Pet()
//
//let janie = Person(pet: olive)
////let dogBreed = janie.pet.breed!
//
//if let dogBreed = janie.pet.breed {
//    print("Olive is a \(dogBreed)")
//} else {
//    print("Olive's breed is unknown")
//}


class Toy {
    
    enum Kind {
        case ball
        case zombie
        case bone
        case mouse
    }
    
    enum Sound {
        case squeak
        case bell
    }
    
    let kind: Kind
    let color: String
    var sound: Sound?
    
    init(kind: Kind, color: String, sound: Sound? = nil) {
        self.kind = kind
        self.color = color
        self.sound = sound
    }
}

class Pet {
    
    enum Kind {
        case dog
        case cat
        case guineaPig
    }
    
    let name: String
    let kind: Kind
    let favoriteToy: Toy?
    
    init(name: String, kind: Kind, favoriteToy: Toy? = nil) {
        self.name = name
        self.kind = kind
        self.favoriteToy = favoriteToy
    }
}

class Person {
    let pet: Pet?
    
    init(pet: Pet? = nil) {
        self.pet = pet
    }
}
























//// Error protocol


