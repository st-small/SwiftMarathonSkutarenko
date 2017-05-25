import UIKit

let MaxNameLength = 50

class Human {
    
    var name : String {
        didSet {
            if name.characters.count > MaxNameLength {
                name = oldValue
            }
        }
    }
    
    lazy var storyOfMyLife : String! = "This is story of my entire life..."
    
    //static let maxAge = 100
    
    class var maxAge : Int {
        return 100
    }
    
    var age : Int {
        didSet {
            if age > Human.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

enum Direction {
    
    static let enumDescription = "Directions in the game"
    
    case Left
    case Right
    case Top
    case Bottom
    
    var isVerical : Bool {
        return self == .Top || self == .Bottom
    }
    
    var isHorizontal : Bool {
        return !isVerical
    }
}

let d = Direction.Right

d.isVerical
d.isHorizontal

Direction.enumDescription

struct Cat {
    
    var name : String {
        didSet {
            if name.characters.count > MaxNameLength {
                name = oldValue
            }
        }
    }
    
    static let maxAge = 20
    
    static var totalCats = 0
    
    var age : Int {
        didSet {
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        
        Cat.totalCats += 1
    }
}

let human = Human(name: "Peter", age: 40)

var cat = Cat(name: "Whiten", age: 10)

human.age = 1000
cat.age = 50

human.age
cat.age

Cat.totalCats

let cat1 = Cat(name: "Whiten", age: 10)
let cat2 = Cat(name: "Whiten", age: 10)

Cat.totalCats

cat.name = "dkjhgdjkghgkldfjfdlkj kgfkdlfkhfkf"
cat.name

human.storyOfMyLife
human
