import UIKit

class Human {
    var weight : Int
    var age : Int
    
    init(weight: Int, age: Int) {
        self.weight = weight
        self.age = age
    }
    
    convenience init(age: Int) {
        self.init(weight: 0, age: age)
    }
    
    convenience init(weight: Int) {
        self.init(weight: weight, age: 0)
    }
    
    convenience init() {
        self.init(weight: 0)
    }
    
    func test() {
        
    }
}

let h1 = Human(weight: 70, age: 25)
let h2 = Human(age: 25)
let h3 = Human()
h3.age
h3.weight

class Student : Human {
    
    var firstName : String
    var lastName : String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        super.init(weight: 0, age: 0)
        
        test()
        self.weight = 50
        test()
    }
    
    convenience init(firstName: String) {
        //test()
        self.init(firstName: firstName, lastName: "")
        self.age = 28
        test()
    }
}

class Doctor : Student {
    
    var fieldOfStudy : String = ""
    
//    init(fielsOfStudy: String) {
//        self.fieldOfStudy = fieldOfStudy
//        super.init(firstName: "Doctor", lastName: "House")
//    }
    
    convenience init(fieldOfStudy: String) {
        self.init(firstName: "Doctor", lastName: "House")
        self.fieldOfStudy = fieldOfStudy
    }
}

let d1 = Doctor(firstName: "aaa")
print(d1.firstName)

let d2 = Doctor(








