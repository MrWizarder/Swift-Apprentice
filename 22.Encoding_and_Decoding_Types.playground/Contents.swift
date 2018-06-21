//: Playground - noun: a place where people can play

import UIKit


//// Encodable and Decodable protocols

//func encode(to: Encoder) throws

//init(from decoder: Decoder) throws


//// What is Codable?

//typealias Codable = Encodable & Decoder

//// Automatic encoding and decoding

//struct Employee: Codable {
//    var name: String
//    var id: Int
//    var favoriteToy: Toy
//
//    enum CodingKeys: String, CodingKey {
//        case id = "employeeId"
//        case name
//        case favoriteToy
//    }
//}
//
//struct Toy: Codable {
//    var name: String
//}


//// Encoding and decoding custom types

//{ "name": "John Appleseed", "id": 7 }

//// JSONEncoder and JSONDecoder

//let toy1 = Toy(name: "Teddy Bear")
//let employee1 = Employee(name: "John Appleseed", id: 7, favoriteToy: toy1)
//
//let jsonEncoder = JSONEncoder()
//let jsonData = try jsonEncoder.encode(employee1)
//print(jsonData)
//
//let jsonString = String(data: jsonData, encoding: .utf8)
//print(jsonString!)


//let jsonDecoder = JSONDecoder()
//let employee2 = try jsonDecoder.decode(Employee.self, from: jsonData)


//// Renaming properties with CodingKeys

//// CodingKey protocol, CodingKeys enum
// CodingKeys nested enum


//// Manual encoding and decoding

// { "employeeId": 7, "name": "John Appleseed", "gift": "Teddy Bear" }

//// The encode function

struct Employee {
    var name: String
    var id: Int
    var favoriteToy: Toy
    
    enum CodingKeys: String, CodingKey {
        case id = "employeeId"
        case name
        case gift
    }
}

struct Toy: Codable {
    var name: String
}

extension Employee: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
        try container.encode(favoriteToy.name, forKey: .gift)
    }
}

let toy1 = Toy(name: "Teddy Bear")
let employee1 = Employee(name: "John Appleseed", id: 7, favoriteToy: toy1)

let jsonEncoder = JSONEncoder()
let jsonData = try jsonEncoder.encode(employee1)
print(jsonData)

let jsonString = String(data: jsonData, encoding: .utf8)
print(jsonString!)


//// The decode function

extension Employee: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        id = try values.decode(Int.self, forKey: .id)
        let gift = try values.decode(String.self, forKey: .gift)
        favoriteToy = Toy(name: gift)
    }
}

let jsonDecoder = JSONDecoder()
let employee2 = try jsonDecoder.decode(Employee.self, from: jsonData)





//// Challenges

// 1

struct Spaceship: Codable {
    var name: String
    var crew: [Spaceman]
    
    enum CodingKeys: String, CodingKey {
        case name = "spaceship_name"
        case crew
    }
}

struct Spaceman: Codable {
    var name: String
    var race: String
}

let spaceman = Spaceman(name: "Worf", race: "Klingon")
let spaceship = Spaceship(name: "USS Enterprise", crew: [spaceman])

let jsonEncoder1 = JSONEncoder()
let jsonData1 =  try jsonEncoder1.encode(spaceship)
let jsonString1 = String(data: jsonData1, encoding: .utf8)
print(jsonString1!)



