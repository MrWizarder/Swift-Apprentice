//: Playground - noun: a place where people can play

import UIKit


//// Values defined by other values

enum PetKind {
    case cat
    case dog
}

struct KeeperKind {
    var keeperOf: PetKind
}

let catKeeper = KeeperKind(keeperOf: .cat)
let dogKeeper = KeeperKind(keeperOf: .dog)



//// Types defined by other types

class Cat1 {}
class Dog1 {}
class KeeperForCats {}
class KeeperForDogs {}


//// Anatomy of generic types

//class Keeper<Animal> {}
//
//var aCatKeeper = Keeper<Cat1>()


//// Using type parameters

class Cat {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Dog {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Keeper<Animal> {
    var name: String
    var morningCare: Animal
    var afternoonCare: Animal
    
    init(name: String, morningCare: Animal, afternoonCare: Animal) {
        self.name = name
        self.morningCare = morningCare
        self.afternoonCare = afternoonCare
    }
}

let jason = Keeper(name: "Jason", morningCare: Cat(name: "Whiskers"), afternoonCare: Cat(name: "Sleepy"))
let jason1 = Keeper(name: "jason1", morningCare: Dog(name: "lastphere"), afternoonCare: Dog(name: "lalal"))


//// Type constraints

class Keeper1<Animal: Pet> {
    
}

protocol Pet {
    var name: String { get }
}
extension Cat: Pet {}
extension Dog: Pet {}

let cats = ["Miss Gray", "Whiskers"].map { Cat(name: $0) }
let dogs = ["Sparky", "Rusty", "Astro"].map { Dog(name: $0) }
let pets: [Pet] = [Cat(name: "Mittens"), Dog(name: "Yeller")]


// 1
func herd(_ pets: [Pet]) {
    pets.forEach {
        print("Come \($0.name)!")
    }
}

// 2
func herd<Animal: Pet>(_ pets: [Animal]) {
    pets.forEach {
        print("Here \($0.name)!")
    }
}

// 3
func herd<Animal: Dog>(_ dogs: [Animal]) {
    dogs.forEach {
        print("Here \($0.name)! Come here!")
    }
}

herd(pets)
herd(cats)
herd(dogs)

extension Array where Element: Cat {
    func meow() {
        forEach { print("\($0.name) says meow!") }
    }
}

cats.meow()
//dogs.meow()


//// Arrays

let animalAges: [Int] = [2,5,7,9]
let animalAges1: Array<Int> = [2,5,7,9]


//// Dictionaries

//struct Dictionary<Key: Hashable, Value>

let intNames: Dictionary<Int, String> = [42: "forty-two"]

let intName2: [Int: String] = [42: "forty-two", 7: "seven"]
let intName3 = [42: "forty-two", 7: "seven"]


//// Optionals

enum OptionalDate {
    case none
    case some(Date)
}

enum OptionalString {
    case none
    case some(String)
}

struct FormResults {
    var birthday: OptionalDate
    var lastName: OptionalString
}


enum Optional<Wrapped> {
    case none
    case some(Wrapped)
}

//var birthdate: Optional<Date> = .none
//if birthdate == .none {
//
//}

var birthdate: Date? = nil
if birthdate == nil {
    
}



//// Generic function parameters

func swapped<T, U>(_ x: T, _ y: U) -> (U, T) {
    return (y, x)
}

let swap = swapped(33, "Jay")
swap.0



