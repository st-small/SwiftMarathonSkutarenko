import UIKit

struct Point {
    var x : Int
    var y : Int
//    mutating func moveByX(x: Int, andY y: Int) {
//        self.x += x
//        self.y += y
//    }
    
    mutating func moveByX(x: Int, andY y: Int) {
        self = Point(x: self.x + x, y: self.y + y)
    }
}

enum Color {
    
    static func numberOfElements() -> Int {
        self.printColor()
        return 2
    }
    
    case White
    case Black
    
    mutating func invert() -> Color {
        if self == Color.White {
            self = Color.Black
        } else {
            self = Color.White
        }
        
        //self = self == Color.White ? Color.Black : Color.White
        self.printColor()
        return self
    }
    
    func printColor() {
        if self == Color.White {
            print("White")
        } else {
            print("Black")
        }
    }
    
    static func printColor() {
        print("enum")
    }
}

var c = Color.White
//c.printColor()
//c.invert()
//c.printColor()
c.invert().printColor()
c.invert().printColor()
c.invert().printColor()
c.invert().printColor()

Color.numberOfElements()

func move(somePoint point: Point, byX x: Int, andY y: Int) -> Point {
    var tempPoint = point
    tempPoint.x += x
    tempPoint.y += y
    return tempPoint
}

var p1 = Point(x: 1, y: 1)
var p2 = Point(x: 2, y: 2)


//p1 = move(somePoint: p, byX: 2, andY: 4)

p1.moveByX(x: 5, andY: 5)
p2













