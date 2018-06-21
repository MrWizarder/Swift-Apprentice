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

