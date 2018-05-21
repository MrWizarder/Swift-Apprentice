//: Playground - noun: a place where people can play

import UIKit


// Arrays

var subscribers: [String] = []
let allZeors = Array(repeating: 0, count: 5)
let vowels = ["A", "E", "I", "O", "U"]


var players = ["Alice", "Bob", "Cindy", "Dan"]

print(players.isEmpty)
if players.count < 2 {
    print("We need at least two players!")
} else {
    print("Let's start!")
}

var currentPlayer = players.first
print(players.last as Any)

currentPlayer = players.min()
print(currentPlayer as Any)

print([2, 3, 1].first as Any)
print([2, 3, 1].min() as Any)

if let currentPlayer = currentPlayer {
    print("\(currentPlayer) will start")
}

var firstPlayer = players[0]
print("First player is \(firstPlayer)")

var player = players[3]

let upcomingPlayersSlice = players[1...2]
print(upcomingPlayersSlice[1], upcomingPlayersSlice[2])

let upcomingPlayersArray = Array(players[1...2])
print(upcomingPlayersArray[0], upcomingPlayersArray[1])

players[1...3].contains("Bob")



players.append("Eli")
players += ["Gina"]
print(players)
players.insert("Frank", at: 5)

var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed")


let index = players.index(of: "Dan")
print("\(index ?? 0)")

print(players)
players[5] = "Franklin"
print(players)

players[0...1] = ["Donna", "Craig", "Brian", "Anna"]

let playerAnna = players.remove(at: 3)
players.insert(playerAnna, at: 0)
print(players)

players.swapAt(1, 3)
print(players)

players.sort()
print(players)

let scores = [2, 2, 8, 6, 1, 2, 1]
for player in players {
    print(player)
}

func sumOfElements(in array: [Int]) -> Int {
    var sum = 0
    for number in array {
        sum += number
    }
    return sum
}
print(sumOfElements(in: scores))



// Dictionaries

var namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores)

var pairs: [String: Int] = [:]
pairs.reserveCapacity(20)

print(namesAndScores["Anna"] as Any)
namesAndScores.isEmpty
namesAndScores.count

var bobData = [
    "name": "Bob",
    "profession": "Card Player",
    "country": "USA"
]
bobData.updateValue("CA", forKey: "state")
bobData["city"] = "San Francisco"

var testDic = [
    "One": 2
]

bobData.updateValue("Bobby", forKey: "name")
bobData["profession"] = "Mailman"
bobData.removeValue(forKey: "state")
//bobData["city"] = nil
bobData.updateValue("", forKey: "city")
print(bobData)

for (player, score) in namesAndScores {
    print("\(player) - \(score)")
}
for player in namesAndScores.keys {
    print("\(player), ", terminator: "")
}
print("")

print("some string".hashValue)
print(1.hashValue)
print(false.hashValue)


// Sets

let setOne: Set<Int>
let someArray = [1, 2, 3, 1]
var someSet: Set<Int> = [1, 2, 3, 1]
print(someSet)
print(someSet.contains(1))
print(someSet.contains(4))
someSet.first
someSet.insert(5)
let removedElement = someSet.remove(1)
print(removedElement ?? 0)


let array1 = [Int]()
//let array2 = []
let array3: [String] = []
var array4 = [1, 2, 3]
print(array4[0])
//print(array4[5])
array4[1...2]
array4[0] = 4
array4.append(4)
print(array4)

var array5 = [1, 2, 3]
array5[0] = array5[1]
print(array5)
array5[0...1] = [4, 5]
//array5[0] = "Six"
//array5 += 6
for item in array5 { print(item) }

//let dict1: [Int, Int] = [:]
//let dict2 = [:]
let dict3: [Int: Int] = [:]

var dict4: [String : Int?] = ["One": 1, "Two": 2, "Three": 3]
//dict4[1]
dict4["One"]
dict4["Zero"] = 0
//dict4[0] = "Zero"
dict4.updateValue(nil, forKey: "One")
print(dict4)

var dict5 = ["NY": "New York", "CA": "California"]
dict5["NY"]
dict5["WA"] = "Washington"
dict5["CA"] = nil
print(dict5)




















