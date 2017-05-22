import UIKit

//let student1 = (name: "Alex", age: 20)
//let student2 = (name: "Bob", age: 22)
//
//student1.name
//student2.name
//
//let student3 = (nam: "Sam", ag: 23)
//
//student3.nam

class StudentClass {
    var name : String
    var age : Int
    
    init() {
        name = "No Name"
        age = 20
    }
    
    init(name: String, age : Int) {
        self.name = name
        self.age = age
    }
}

struct StudentStruct {
    
    var name : String
    var age : Int
    
}

func addOneYear(student: StudentClass) {
    student.age += 1
    
    student
}

func addOneYear(student: inout StudentStruct) {
    var student = student
    student.age += 1
    
    student
}

let stClass1 = StudentClass(name: "Bob", age: 18)

print(stClass1)
stClass1.name = "Alex"
stClass1.age = 21

var stStruct1 = StudentStruct(name: "Sam", age: 24)

//stStruct1.name = "Sam2"
//stStruct1.age = 21

stStruct1

var stStruct2 = stStruct1

stStruct2.age = 25
stStruct2.name = "Samuel"

stStruct2.age
stStruct2.name

stStruct1.age
stStruct1.name

stStruct2
stStruct1

var stClass2 = stClass1

stClass2.age
stClass2.name

stClass2.age = 20
stClass2.name = "AAA"

stClass2
stClass1

stClass2.age
stClass2.name
stClass1.age
stClass1.name

stStruct1.age
addOneYear(student: &stStruct1)
stStruct1.age

stClass1.age
addOneYear(student: stClass1)
stClass1.age

var arrayStructs = [stStruct1]
arrayStructs[0]
arrayStructs[0].age = 50
arrayStructs[0]
stStruct1

var arrayClasses = [stClass1]
arrayClasses[0]
arrayClasses[0].age = 50
arrayClasses[0]
stClass1









