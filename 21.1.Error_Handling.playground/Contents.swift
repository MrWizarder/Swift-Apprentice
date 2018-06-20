//: Playground - noun: a place where people can play

import UIKit


//// Error protocol


class Pastry {
    let flavor: String
    var numberOnHand: Int
    
    init(flavor: String, numberOnHand: Int) {
        self.flavor = flavor
        self.numberOnHand = numberOnHand
    }
}

enum BakeryError: Error {
    case tooFew(numberOnHand: Int)
    case doNotSell
    case wrongFlavor
}



//// Throwing errors

class Bakery {
    var itemsForSale = [
        "Cookie": Pastry(flavor: "ChocolateChip", numberOnHand: 20),
        "PopTart": Pastry(flavor: "WildBerry", numberOnHand: 13),
        "Donut": Pastry(flavor: "Sprinkles", numberOnHand: 24),
        "HandPie": Pastry(flavor: "Cherry", numberOnHand: 6)
    ]
    
    func orderPastry(item: String,
                     amountRequested: Int,
                     flavor: String) throws -> Int {
        guard let pastry = itemsForSale[item] else {
            throw BakeryError.doNotSell
        }
        guard flavor == pastry.flavor else {
            throw BakeryError.wrongFlavor
        }
        guard amountRequested <= pastry.numberOnHand else {
            throw BakeryError.tooFew(numberOnHand: pastry.numberOnHand)
        }
        pastry.numberOnHand -= amountRequested
        
        return pastry.numberOnHand
    }
}

let bakery = Bakery()
//bakery.orderPastry(item: "Albatross",
//                   amountRequested: 1,
//                   flavor: "AlbatrossFlavor")



//// Handling errors

do {
    try bakery.orderPastry(item: "Albatross",
                           amountRequested: 1,
                           flavor: "AlbatrossFlavor")
} catch BakeryError.doNotSell {
    print("Sorry, but we don't sell this item")
} catch BakeryError.wrongFlavor {
    print("Sorry, but we don't carry this flavor")
} catch BakeryError.tooFew {
    print("Sorry, we don't have enough items to fulfill your order")
}



//// Not looking at the detailed error

let remaining = try? bakery.orderPastry(item: "Albatross",
                                        amountRequested: 1,
                                        flavor: "AlbatrossFlavor")



//// Stoping your program on an error

do {
    try bakery.orderPastry(item: "Cookie",
                           amountRequested: 1,
                           flavor: "ChocolateChip")
}
catch {
    fatalError()
}

try! bakery.orderPastry(item: "Cookie",
                        amountRequested: 1,
                        flavor: "ChocolateChip")





//// Advanced error handling

//// PugBot

enum Direction {
    case left
    case right
    case forward
}

enum PugBotError: Error {
    case invalidMove(found: Direction, expected: Direction)
    case endOfPath
}

class PugBot {
    let name: String
    let correctPath: [Direction]
    private var currentStepInPath = 0
    
    init(name: String, correctPath: [Direction]) {
        self.correctPath = correctPath
        self.name = name
    }
    
    func turnLeft() throws {
        guard currentStepInPath < correctPath.count else {
            throw PugBotError.endOfPath
        }
        let nextDirection = correctPath[currentStepInPath]
        guard nextDirection == .left else {
            throw PugBotError.invalidMove(found: .left,
                                          expected: nextDirection)
        }
        currentStepInPath += 1
    }
    
    func turnRight() throws {
        guard currentStepInPath < correctPath.count else {
            throw PugBotError.endOfPath
        }
        let nextDirection = correctPath[currentStepInPath]
        guard nextDirection == .right else {
            throw PugBotError.invalidMove(found: .right,
                                          expected: nextDirection)
        }
        currentStepInPath += 1
    }
    
    func moveForward() throws {
        guard currentStepInPath < correctPath.count else {
            throw PugBotError.endOfPath
        }
        let nextDirection = correctPath[currentStepInPath]
        guard nextDirection == .forward else {
            throw PugBotError.invalidMove(found: .forward,
                                          expected: nextDirection)
        }
        currentStepInPath += 1
    }
    
    func reset() {
        currentStepInPath = 0
    }
}

let pug = PugBot(name: "Pug",
                 correctPath: [.forward, .left, .forward, .right])

func goHome() throws {
    try pug.moveForward()
    try pug.turnLeft()
    try pug.moveForward()
    try pug.turnRight()
}

do {
    try goHome()
} catch {
    print("PugBot failed to get home.")
}



//// Handling multiple errors

func moveSafely(_ movement: () throws -> ()) -> String {
    do {
        try movement()
        return "Completed operation successfully."
    } catch PugBotError.invalidMove(let found, let expected) {
        return "The PugBot was supposed to move \(expected), but moved \(found) instead."
    } catch PugBotError.endOfPath {
        return "The PugBot tried to move past the end of the path."
    } catch {
        return "An unknown error occurred"
    }
}

pug.reset()
moveSafely(goHome)


pug.reset()
moveSafely {
    try pug.moveForward()
    try pug.turnLeft()
    try pug.moveForward()
    try pug.turnRight()
}



