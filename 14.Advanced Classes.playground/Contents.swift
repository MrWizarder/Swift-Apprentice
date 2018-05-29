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
    
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    deinit {
        print("\(firstName) \(lastName) is being removed from memory!")
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
 
    convenience init(transfer: Student) {
        self.init(firstName: transfer.firstName, lastName: transfer.lastName)
    }
    
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
    
    required init(firstName: String, lastName: String) {
        self.sports = []
        super.init(firstName: firstName, lastName: lastName)
    }
    
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


//// When and why to subclass

//// Strong types
class Team {
    var players: [StudentAthlete] = []
    
    var isEligible: Bool {
        for player in players {
            if !player.isEligible {
                return false
            }
        }
        return true
    }
}

//// Shared base classes

// A button that can be pressed.
class Button {
    func press() {}
}

// An image that can be rendered on a button
class Image {}

// A button that is composed entirely of an image.
class ImageButton: Button {
    var image: Image
    
    init(image: Image) {
        self.image = image
    }
}

// A button that renders as text.
class TextButton: Button {
    var text: String
    
    init(text: String) {
        self.text = text
    }
}



//// Understanding the class lifecycle

var someone = Person(firstName: "Johnny", lastName: "Appleseed")
// Person object has a reference count of 1 (someone variable)

var anotherSomeone: Person? = someone
// Reference count 2 (someone, anotherSomeone)

var lotsOfPeople = [someone, someone, anotherSomeone, someone]
// Reference count 6 (someone, anotherSomeone, 4 references in lotsOfPeople)

anotherSomeone = nil
// Reference count 5 (someone, 4 references in lotsOfPeople)

lotsOfPeople = []
// Reference count 1 (someone)

someone = Person(firstName: "Johnny", lastName: "Appleseed")
// Reference count 0 for the original Person object!
// Variable someone now references a new object


//// Deinitialization


//// Retain cycles and weak references




