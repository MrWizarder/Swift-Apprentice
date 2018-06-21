//: Playground - noun: a place where people can play

import UIKit



//// Referece cycles for classes

class Tutorial {
    let title: String
    unowned let author: Author
    weak var editor: Editor?
    lazy var createDescription: () -> String = {
        [unowned self] in
        return "\(self.title) by \(self.author.name)"
    }
    
    init(title: String, author: Author) {
        self.title = title
        self.author = author
    }
    
    deinit {
        print("Goodbye Tutorial \(title)")
    }
}

class Editor {
    let name: String
    var tutorials: [Tutorial] = []
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Goodbye Editor \(name)!")
    }
}

class Author {
    let name: String
    var tutorials: [Tutorial] = []
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Goodbye Author \(name)!")
    }
}


do {
    let author = Author(name: "Cosmin")
    let tutorial: Tutorial = Tutorial(title: "Memory management", author: author)
    let editor: Editor = Editor(name: "Ray")
    author.tutorials.append(tutorial)
    tutorial.editor = editor
    editor.tutorials.append(tutorial)
    
    print(tutorial.createDescription())
}

//// Weak references

//// Unowned references



//// Reference cycles for closures

// non escaping closures


//// Capture lists

var counter = 0
var closure = { [counter] in print(counter) }
counter = 1
closure()


//// Unowned self




//// Handling asynchronous closures

//Note: Swift initialization of global data and reference counting are thread safe so you don’t need to worry about those fundamental things.


//// GCD

func log(message: String) {
    let thread = Thread.current.isMainThread ? "Main" : "Background"
    print("\(thread) thread: \(message)")
}

func addNumbers(upTo range: Int) -> Int {
    log(message: "Adding numbers...")
    return (1...range).reduce(0, +)
}


let queue = DispatchQueue(label: "queue")

// 1
func execute<Result>(backgroundWork: @escaping () -> Result,
                     mainWork: @escaping (Result) -> ()) {
    // 2
    queue.async {
        let result = backgroundWork()
        // 3
        DispatchQueue.main.async {
            mainWork(result)
        }
    }
}

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

execute(backgroundWork: { addNumbers(upTo: 100) },
        mainWork: { log(message: "The sum is \($0)") })


//// Weak self

extension Editor {
    func feedback(for tutorial: Tutorial) -> String {
        let tutorialStatus: String
        // Should use the tutorial.content here, really. :]
        // Instead, flip a coin
        if arc4random_uniform(10) % 2 == 0 {
            tutorialStatus = "published"
        } else {
            tutorialStatus = "rejected"
        }
        return "Tutorial \(tutorialStatus) by \(self.name)"
    }
    
    func editTutorial(_ tutorial: Tutorial) {
        queue.async() {
            [weak self] in
            
            guard let strongSelf = self else {
                print("I no longer exist so no feedback for you!")
                return
            }
            DispatchQueue.main.async {
                print(strongSelf.feedback(for: tutorial))
            }
        }
    }
}



//// The strong weak pattern






//// Challenges

// 1

class Person {
    let name: String
    let email: String
    weak var car: Car?
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    deinit {
        print("Goodbye \(name)!")
    }
}

class Car {
    let id: Int
    let type: String
    var owner: Person?
    
    init(id: Int, type: String) {
        self.id = id
        self.type = type
    }
    
    deinit {
        print("Goodbye \(type)!")
    }
}

var owner: Person? = Person(name: "Cosmin",
                            email: "cosmin@whatever.com")
var car: Car? = Car(id: 10, type: "BMW")

owner?.car = car
car?.owner = owner

owner = nil
car = nil


// 2

class Customer {
    let name: String
    let email: String
    var account: Account?
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    deinit {
        print("Goodbye \(name)!")
    }
}

class Account {
    let number: Int
    let type: String
    unowned let customer: Customer
    
    init(number: Int, type: String, customer: Customer) {
        self.number = number
        self.type = type
        self.customer = customer
    }
    
    deinit {
        print("Goodbye \(type) account number \(number)!")
    }
}

var customer: Customer? = Customer(name: "George",
                                   email: "george@whatever.com")
var account: Account? = Account(number: 10, type: "Paypal", customer: customer!)

customer?.account = account

account = nil
customer = nil


