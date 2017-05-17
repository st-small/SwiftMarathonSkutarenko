import UIKit

var age = 67

if age == 21 {
    
} else if age == 22 {
    
} else {
    
}

switch age {
case 21: //....
    break
default:
    break
}

switch age {
    case 0...16: print("школота"); fallthrough
    case 17...21: print("студент")
    case 22...50: print("")
    case 51, 53, 55: print("сработало")
    default:
        break
}

//mainLoop: for _ in 0...1000 {
//    for i in 0..<20 {
//        
//        if i < 15 {
//            continue
//        }
//        
//        if i == 10 {
//            break mainLoop
//        }
//        print(i)
//    }
//}

var name = "Alex"

switch name {
    case "Alex" where age < 50 : print("hi buddy!")
    case "Alex" where age >= 50 : print("I don't know you!")
    default: break
}

var optional : Int? = 5

if let a = optional {
    print("\(a) != nil")
}

let tuple = (name, age)

switch tuple {
    case ("Alex", 60): print("hi Alex 60")
    case ("Alex", 59): print("hi Alex 59")
    
    case (_, let number) where number >= 65 && number <= 70 : print("hi oldman")

    case ("Alex", _): print("hi Alex")
    default: break
}

let point = (5,-7)

switch point {
    case let (x,y) where x == y: print("x == y")
    case let (x,y) where x == -y: print("x == -y")
    case let (_,y) where y < 0: print("y < 0")
    
    default: break
}

let array : [CustomStringConvertible] = [5, 5.4, Float(5.4)]

switch array[0] {
    case _ as Int: print("Int")
    case _ as Float: print("Float")
    case _ as Double: print("Double")
    
    default: break
}














