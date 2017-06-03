import UIKit

protocol EntryName {
    var label: String { get }
    
}

class Student : EntryName {
    
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Animal {
    
}

class Cow : Animal, EntryName {
    var name: String?
}

struct Grass : EntryName {
    var type: String
}

let student1 = Student(firstName: "Bob", lastName: "Shmob")
let student2 = Student(firstName: "Bill", lastName: "Shmill")
let student3 = Student(firstName: "Brian", lastName: "Shmian")

let cow1 = Cow()
cow1.name = "Burenka"
let cow2 = Cow()

let grass1 = Grass(type: "Bermuda")
let grass2 = Grass(type: "St. Augustine")

var array: [EntryName] =
    [cow1, student1, grass2, cow2, student3, grass1, student2]

//for value in array {
//    
////    if let grass = value as? Grass {
////        print(grass.type)
////    } else if let student = value as? Student {
////        print(student.fullName)
////    } else if let cow = value as? Cow {
////        print(cow.name ?? "a cow")
////    }
//    
//    switch value {
//    case let grass as Grass: print(grass.type)
//    case let student as Student: print(student.fullName)
//    case let cow as Cow: print(cow.name ?? "a cow")
//    default: break
//    }
//}

func printFarm(array: [EntryName]) {
    
    
    
}

















