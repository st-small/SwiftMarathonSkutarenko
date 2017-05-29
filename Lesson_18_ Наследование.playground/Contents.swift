import UIKit

class Human {
    
    var firstName : String = ""
    var lastName : String = ""
    
    var fullName : String {
            return firstName + " " + lastName
    }
    
    func sayHello() -> String {
        return "Hello"
    }
}

class SmartHuman : Human {
    
    
}

class Student : SmartHuman {
    
    override func sayHello() -> String {
        return super.sayHello() + " my friend"
    }
    
}

class Kid : Human {
    
    var favoriteToy : String = "iMac"
    
    override func sayHello() -> String {
        return "agu"
    }
    
    override var fullName: String {
        return firstName
    }
    
    override var firstName: String {
        set {
            super.firstName = newValue + " :))"
        }
        get {
            return super.firstName
        }
    }
    
    override var lastName: String {
        didSet {
            print("new value " + self.lastName)
        }
    }
}

let human = Human()
human.firstName = "Alex"
human.lastName = "Skutarenko"
human.fullName
human.sayHello()

let student = Student()
student.firstName = "Max"
student.lastName = "Mix"
student.fullName
student.sayHello()

let kid = Kid()
kid.firstName = "Kid"
kid.lastName = "123456"
kid.fullName
kid.favoriteToy
kid.sayHello()

let array : [Human] = [kid, student, human]

for value in array {
    print(value.sayHello())
}















