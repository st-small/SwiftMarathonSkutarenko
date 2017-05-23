import UIKit

struct Student {
    
    var firstName : String {
        
        willSet(newFirstName) {
            print("will set" + newFirstName + " instead of " + firstName)
        }
        
        didSet(oldFirstName) {
            print("did set" + firstName + " instead of " + oldFirstName)
        }
    }
}


var student = Student(firstName: "Alex")
student.firstName

student.firstName = "Bob"