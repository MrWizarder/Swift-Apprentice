//: Playground - noun: a place where people can play

import UIKit


//// Introducing inheritance

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

//class Student {
//    var firtName: String
//    var lastName: String
//    var grades: [Grade] = []
//
//    init(firstName: String, lastName: String) {
//        self.firtName = firstName
//        self.lastName = lastName
//    }
//
//    func recordGrade(_ grade: Grade) {
//        grades.append(grade)
//    }
//}

class Student: Person {
    var grades: [Grade] = []
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

let john = Person(firstName: "Johny", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")

john.firstName
jane.firstName

let history = Grade(letter: "B", points: 9.0, credits: 3.0)
jane.recordGrade(history)

class BandMember: Student {
    var minimumPracticeTime = 2
}

class OboePlayer: BandMember {
    override var minimumPracticeTime: Int {
        get {
            return super.minimumPracticeTime * 2
        }
        set {
            super.minimumPracticeTime = newValue / 2
        }
    }
}


//// Polymorphism

func phonebookName(_ person: Person) -> String {
    return "\(person.lastName), \(person.firstName)"
}

let person = Person(firstName: "Johnny", lastName: "Appleseed")
let oboePlayer = OboePlayer(firstName: "Jane", lastName: "Appleseed")

phonebookName(person)
phonebookName(oboePlayer)


//// Runtime hierarchy checks

var hallMonitor = Student(firstName: "Jill", lastName: "Bananapeel")
hallMonitor = oboePlayer

oboePlayer as Student
//(oboePlayer as Student).minimumPracticeTime

hallMonitor as? BandMember
(hallMonitor as? BandMember)?.minimumPracticeTime

hallMonitor as! BandMember
(hallMonitor as! BandMember).minimumPracticeTime


if let hallMonitor = hallMonitor as? BandMember {
    print("This hall monitor is a band member and practices at least \(hallMonitor.minimumPracticeTime) hours per week")
}

func afterClasActivity(for student: BandMember) -> String {
    return "Goes to practice!"
}
func afterClasActivity(for student: Student) -> String {
    return "Goes home!"
}


afterClasActivity(for: oboePlayer)
afterClasActivity(for: oboePlayer as Student)


//// Inheritance, methods and overrides



