//: Playground - noun: a place where people can play

import UIKit


var multiplyClosure: (Int, Int) -> Int

multiplyClosure = { (a: Int, b: Int) -> Int in
    return a * b
}

multiplyClosure = { (a: Int, b: Int) -> Int in
    a * b
}

multiplyClosure = { (a, b) in
    a * b
}

multiplyClosure = {
    $0 * $1
}


func operateOnNumbers(_ a: Int, _ b: Int,
                      operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    print(result)
    return result
}

let addClosure = { (a: Int, b: Int) in
    a + b
}
operateOnNumbers(4, 2, operation: addClosure)

func addFunction(_ a: Int, _ b: Int) -> Int {
    return a + b
}
operateOnNumbers(4, 2, operation: addFunction)


operateOnNumbers(4, 2, operation: { (a: Int, b: Int) -> Int in
    return a + b
})

operateOnNumbers(4, 2, operation: { $0 + $1 })
operateOnNumbers(4, 2, operation: +)
operateOnNumbers(4, 2) {
    $0 + $1
}


let voidClosure: () -> Void = {
    print("Swift Aprentice is awesome!")
}
voidClosure()


var counter = 0
let incrementCounter = {
    counter += 1
}

incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()


func countingClosure() -> () -> Int {
    var counter = 0
    let incrementCounter: () -> Int = {
        counter += 1
        print(counter)
        return counter
    }
    return incrementCounter
}

let counter1 = countingClosure()
let counter2 = countingClosure()
counter1()
counter2()
counter1()
counter1()
counter2()

let names1 = ["ZZZZZZ", "BB", "A", "CCC", "EEEEE"]
names1.sorted()
names1.sorted {
    $0.count > $1.count
}

let values = [1, 2, 3, 4, 5, 6]
values.forEach {
    print("\($0): \($0*$0)")
}

var prices = [1.5, 10, 4.99, 2.30, 8.19]
let largePrices = prices.filter {
    return $0 > 5
}
print(largePrices)

let salePrices = prices.map {
    return $0 * 0.9
}
print(salePrices)

let userInput = ["0", "11", "haha", "42"]
let numbers1 = userInput.map {
    Int($0)
}
print(numbers1)

let number2 = userInput.flatMap {
    Int($0)
}
print(number2)


let sum = prices.reduce(0) {
    return $0 + $1
}
print(sum, prices)


let stock = [1.5: 5, 10: 2, 4.99: 20, 2.30: 5, 8.19: 30]
let stockSum = stock.reduce(0) {
    return $0 + $1.key * Double($1.value)
}
print(stockSum)


let farmAnimals = ["# ": 5, "$ ": 10, "% ": 50, "! ": 1]
let allAnimals = farmAnimals.reduce(into: []) { (result, this: (key: String, value: Int)) in
    for _ in 0 ..< this.value {
        result.append(this.key)
    }
}
print(allAnimals)

let removeFirst = prices.dropFirst()
let removeFirstTwo = prices.dropFirst(2)
let removeLast = prices.dropLast()
let removeLastTwo = prices.dropLast(2)

let firstTwo = prices.prefix(2)
let lastTwo = prices.suffix(2)


let names = ["liu", "wang", "lisis", "zhangsan"]
let concatenatedNames = names.reduce("") {
    print($0, $1)
    return $0 + $1
}
print(concatenatedNames)

let filterNames = names.filter() {
    $0.count > 4
}
print(filterNames)

let concateFilterNames = names.filter() {
    $0.count > 4
    }.reduce("") {
        return $0 + $1
}
print(concateFilterNames)

let namesAndAges = ["liu": 23, "wang": 40, "lisi": 50, "zhangsan": 15, "lilei": 9]
let yongman = namesAndAges.filter {
    return $0.value < 18
}
print(yongman)

let olderman = namesAndAges.filter {
    return $0.value > 18
    }.map {
        return $0.key
}
print(olderman)




// challenges
func repeatTask(times: Int, task: () -> Void) {
    for _ in 1...times {
        task()
    }
}

let task: () -> Void = {
    print("this is a task.")
}
repeatTask(times: 3, task: task)


let appRatings = [
    "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
    "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
    "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]]

let averageRatings: [String: Double] = appRatings.reduce(into: [:]) { (result, this: (key: String, value: Array)) in
    
    var sum = 0
    this.value.forEach {
        sum += $0
    }
    return result[this.key, default: 0] = Double(sum) / Double(this.value.count)
}
print(averageRatings)


//return result[this.key, default: 0] = Double(this.value.reduce(0) { $0 + $1 }) / Double(this.value.count)



