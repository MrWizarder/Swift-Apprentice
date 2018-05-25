//: Playground - noun: a place where people can play

import UIKit


//// Creating classes

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

let john = Person(firstName: "Johnny", lastName: "Appleseed")


//// Reference types

class SimplePerson {
    let name: String
    init(name: String) {
        self.name = name
    }
}

var var1 = SimplePerson(name: "john")
var var2 = var1

//struct SimplePerson1 {
//    let name: String
//}


//// the heap vs. the stack



//// working with references

struct Location {
    let x: Int
    let y: Int
}

struct DeliveryArea {
    var range: Double
    let center: Location
}

var area1 = DeliveryArea(range: 2.5,
                         center: Location(x: 2, y: 4))
var area2 = area1
print(area1.range)
print(area2.range)

area1.range = 4
print(area1.range)
print(area2.range)


var homeOwner = john
john.firstName = "John"
john.firstName
homeOwner.firstName

//// Object identity

john === homeOwner
let imposterJohn = Person(firstName: "Johnny", lastName: "Appleseed")
john === homeOwner
john === imposterJohn
imposterJohn === homeOwner

homeOwner = imposterJohn
john === homeOwner

homeOwner = john
john === homeOwner

var imposters = (0...100).map { _ in
    Person(firstName: "John", lastName: "Appleseed")
}

imposters.contains {
    $0.firstName == john.firstName && $0.lastName == john.lastName
}

imposters.contains {
    $0 === john
}

imposters.insert(john, at: Int(arc4random_uniform(100)))

imposters.contains {
    $0 === john
}

if let indexOfJohn = imposters.index(where: {$0 === john}) {
    imposters[indexOfJohn].lastName = "Bananapeel"
}

john.fullName

func memberOf(person: Person, group: [Person]) -> Bool {
    return group.contains {$0 === person}
}

var group1 = (0...5).map { _ in
    Person(firstName: "John", lastName: "group1")
}
var group2 = (0...5).map { _ in
    Person(firstName: "John", lastName: "group2")
}

group2.insert(john, at: 4)
memberOf(person: john, group: group1)
memberOf(person: john, group: group2)


//// Methods and mutability

struct Grade {
    let letter: String
    let points: Double
    let credits: Double
}

class Student {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []
    var credits = 0.0
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
        credits += grade.credits
    }
}

let jane = Student(firstName: "Jane", lastName: "Appleseed")
let history = Grade(letter: "B", points: 9.0, credits: 3.0)
var math = Grade(letter: "A", points: 16.0, credits: 4.0)

jane.recordGrade(history)
jane.recordGrade(math)


//// mutability and constants

//jane = Student(firstName: "John", lastName: "Appleseed")



//// Understanding state and side effects

jane.credits

math = Grade(letter: "A", points: 20.0, credits: 5.0)
jane.recordGrade(math)
jane.credits


//// Extending a class using an extension

extension Student {
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}



//// Structures vs. classes recap


//// Chanlleges

// 1
class List {
    var name: String
    var titles: [String]
    init(name: String, titles: [String]) {
        self.name = name
        self.titles = titles
    }
    
    func print() -> String {
        return titles.reduce("") { (result, movie) in
            return result + movie + ","
        }
    }
}

var movieList = List(name: "list1", titles: ["a", "b", "c"])
movieList.print()

class User {
    var dict: [String: List] = [:]
    func addList(_ list: List) -> Void {
        dict[list.name] = list
    }
    func list(forName name: String) -> List? {
        return dict[name]
    }
}

var jane1 = User()
var john1 = User()
jane1.addList(movieList)
john1.addList(movieList)

jane1.list(forName: "list1")!.print()
john1.list(forName: "list1")!.print()

jane1.list(forName: "list1")!.titles.append("d")
jane1.list(forName: "list1")!.print()
john1.list(forName: "list1")!.print()


// 2



