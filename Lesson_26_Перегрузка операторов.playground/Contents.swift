import UIKit

struct Point {
    var x: Int
    var y: Int
}

var p1 = Point(x: 2, y: 3)
var p2 = Point(x: 3, y: 5)

func + (a: Point, b: Point) -> Point {
    
    return Point(x: a.x + b.x, y: a.y + b.y)
}

func * (a: Point, b: Point) -> Point {
    
    return Point(x: a.x * b.x, y: a.y * b.y)
}

func += ( a: inout Point, b: Point) {
    a = a + b
}

func == (a: Point, b: Point) -> Bool {
    
    return a.x == b.x && a.y == b.y
}

func != (a: Point, b: Point) -> Bool {
    
    return a.x != b.x && a.y != b.y
}



p1 + p2
p1 * p2
p1
p2
p1 += p2
p1 == p2
p1 == p1
p1 != p2

var i = 5
i += 1

// Пример для пре- и постфиксных операторов с интами
//prefix func ++ (a: inout Int) -> Int {
//    a += 1
//    return a
//}
//
//postfix func ++ (a: inout Int) -> Int {
//    let b = a
//    a += 1
//    return b
//}
//
//var c = 5
//++c
//c
//c++
//c


prefix func ++ (a: inout Point) -> Point {
    a.x += 1
    a.y += 1
    return a
}

postfix func ++ (a: inout Point) -> Point {
    let b = a
    a.x += 1
    a.y += 1
    return b
}

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

p1++
p1
++p1
p1

p1.x = 7

if (p1++).x == 8 {
    print("8")
} else {
    print("not 8")
}
p1.x

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)
p1++ + p2++

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)
++p1 + ++p2

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)
p1++ + ++p2

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)
++p1 + p2++

// %%%

//infix operator %%% {}
//
//func %%% (a: inout Point, b: Point) -> Point {
//    a.x += b.y
//    a.y -= b.x
//    return a
//}
//
//p1
//p2
//p1 %%% p2

var j = 5

i
j

i / j * 5

// deprecated -> -> -> ВАЩЕ НЕПОНЯТКИ С ЭТОЙ ФИГНЕЙ В СВИФТ 3.0
//infix operator ** {associativity left precedence 120}
//
//func ** (a: Point, b: Point) -> Point {
//    
//    return Point(x: 2 * (a.x + b.x), y: 2 * (a.y + b.y))
//}
//
//p1 = Point(x: 2, y: 3)
//p2 = Point(x: 3, y: 5)
//
//p1 ** p2 ** p1

var s = "Hello, World!"

//s -= "lo"

func -= (s1: inout String, s2: String) {
    s1.lowercased()
    s2.lowercased()
    let set = CharacterSet(charactersIn: s2)
    let components = s1.components(separatedBy: set)
    s1 = components.joined(separator: "")
}

func -= (s1: inout String, i: Int) {
    s1 -= String(i)
}

s -= "lo"
s -= "H"

s = "0123456789"
s -= 5784440





