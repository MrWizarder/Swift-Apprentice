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

class Cat {}
class Dog {}
class KeeperForCats {}
class KeeperForDogs {}


//// Anatomy of generic types

