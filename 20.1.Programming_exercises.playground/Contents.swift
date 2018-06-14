//: Playground - noun: a place where people can play

import UIKit



//// Programming exercises

//// Fibonacci

func fibonacci(position: Int) -> Int {
    switch position {
    // 1
    case let n where n <= 1:
        return 0
        // 2
    case 2:
        return 1
        // 3
    case let n:
        return fibonacci(position: n - 1) + fibonacci(position: n - 2)
    }
}

let fib15 = fibonacci(position: 15)



//// FizzBuzz

for i in 1...100 {
    // 1
    switch (i % 3, i % 5) {
        // 2
    case (0, 0):
        print("FizzBuzz", terminator: " ")
    case (0, _):
        print("Fizz", terminator: " ")
    case (_, 0):
        print("Buzz", terminator: " ")
        // 3
    case (_, _):
        print(i, terminator: " ")
    }
}
print("")





//// Expressiong pattern

// (x, 0, 0)   (identifier, expression, expression)

let matched = (1...10 ~= 5)

if case 1...10 = 5 {
    print("In the range")
}


//// Overloading ~=

let list = [0, 1, 2, 3]
let integer = 2

//let isInArray = (list ~= integer)
//if case list = integer {
//    print("The integer is in the array")
//} else {
//    print("The integer is not in the array")
//}

let isInList = list.contains(integer)

// 1
func ~=(pattern: [Int], value: Int) -> Bool {
    // 2
    for i in pattern {
        if i == value {
            // 3
            return true
        }
    }
    // 4
    return false
}

let isInArray = (list ~= integer)
if case list = integer {
    print("The integer is in the array")
} else {
    print("The integer is not in the array")
}



//// Challenges

// 1

enum FormField {
    case firstName(String)
    case lastName(String)
    case emailAddress(String)
    case age(Int)
}
let minimumAge = 21
let submittedAge = FormField.age(22)

//if case age = minimumAge where age != 21 {
//    print("error")
//}




