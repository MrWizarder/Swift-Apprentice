//: Playground - noun: a place where people can play

import UIKit



//// Referece cycles for classes

class Tutorial {
    let title: String
    unowned let author: Author
    weak var editor: Editor?
    
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
}

//// Weak references

//// Unowned references



//// Reference cycles for closures
