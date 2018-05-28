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

//class StudentAthlete: Student {
//    var sports: [String]
//    var failedClasses: [Grade] = []
//
//    init(firstName: String, lastName: String, sports: [String]) {
//        self.sports = sports
//        super.init(firstName: firstName, lastName: lastName)
//    }
//
//    override func recordGrade(_ grade: Grade) {
//        super.recordGrade(grade)
//
//        if grade.letter == "F" {
//            failedClasses.append(grade)
//        }
//    }
//
//    var isEligible: Bool {
//        return failedClasses.count < 3
//    }
//}


//// Introducing super

//// When to call super

//// Preventing inheritance

final class FinalStudent: Person {}
//class FinalStudentAthlete: FinalStudent {}

class AnotherStudent: Person {
    final func recordGrade(_ grade: Grade) {}
}

class AnotherStudentAthlete: AnotherStudent {
//    override func recordGrade(_ grade: Grade) {}
}


//// Inheritance and class initialization


//// Two-phase initialization

class StudentAthlete: Student {
    var sports: [String]
    var failedClasses: [Grade] = []
    
    init(firstName: String, lastName: String, sports: [String]) {
        // 1
        self.sports = sports
        // 2
        let passGrade = Grade(letter: "P", points: 0.0, credits: 0.0)
        
        // 3
        super.init(firstName: firstName, lastName: lastName)
        // 4
        recordGrade(passGrade)
    }
    
    override func recordGrade(_ grade: Grade) {
        super.recordGrade(grade)
        
        if grade.letter == "F" {
            failedClasses.append(grade)
        }
    }
    
    var isEligible: Bool {
        return failedClasses.count < 3
    }
}


//// Required and convenience initializers


