import UIKit

/*
 1. Для нашей структуры Point перегрузить операторы: -, -=, prefix —, postfix —, /, /=, *=
 
 2. Создать структуру Rect, аналог CGRect, содержащую структуру Size и Point. Перегрузить операторы +, +=, -, -= для этой структуры.
 
 3. Перегрузить оператор + и += для String, но второй аргумент должен быть Int
 
 4. Создать свой оператор, который будет принимать 2 String и в первом аргументе, при совпадении буквы с вторым аргументом, менять совпадения на заглавные буквы
*/

struct Point {
    var x: Double
    var y: Double
}

var p1 = Point(x: 20, y: 30)
var p2 = Point(x: 3, y: 5)

func - (a: Point, b: Point) -> Point {
    return Point(x: a.x - b.x, y: a.y - b.y)
}

func -= (a: inout Point, b: Point) {
    a = a - b
}

prefix func -- (a: inout Point) -> Point {
    a.x -= 1
    a.y -= 1
    return a
}

postfix func -- (a: inout Point) -> Point {
    let b = a
    a.x -= 1
    a.y -= 1
    return b
}

func / (a: Point, b: Point) -> Point {
    return Point(x: a.x / b.x, y: a.y / b.y)
}

func /= (a: inout Point, b: Point) {
    a = a / b
}

func * (a: Point, b: Point) -> Point {
    return Point(x: a.x * b.x, y: a.y * b.y)
}

func *= (a: inout Point, b: Point) {
    a = a * b
}

p1 - p2
p1 -= p2

--p1
p1--
p1
p1 = Point(x: 21, y: 30)
p2 = Point(x: 3, y: 5)
p1 / p2
p1 /= p2
p1
p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)
p1 * p2
p1 *= p2
p1

struct Size {
    var height: Double
    var width: Double
}

struct Rect {
    var origin: Point
    var size: Size
    
    init(x: Double, y: Double, height: Double, weight: Double) {
        origin = Point(x: x, y: y)
        size = Size(height: height, width: weight)
    }
}

// +, +=, -, -=

func + (a: Rect, b: Rect) -> Rect {
    let aXBegin = a.origin.x
    let aXEnd = aXBegin + a.size.width
    let aYBegin = a.origin.y
    let aYEnd = aYBegin + a.size.height
    
    let bXBegin = b.origin.x
    let bXEnd = bXBegin + b.size.width
    let bYBegin = b.origin.y
    let bYEnd = bYBegin + b.size.height
    
    let newX = aXBegin <= bXBegin ? aXBegin : bXBegin
    let newY = aYBegin <= bYBegin ? aYBegin : bYBegin
    let newW = (aXEnd <= bXEnd ? bXEnd : aXEnd) - newX
    let newH = (aYEnd <= bYEnd ? bYEnd : aYEnd) - newY
    return Rect(x: newX, y: newY, height: newH, weight: newW)
}

func += (a: inout Rect, b: Rect) {
    a = a + b
}

func - (a: Rect, b: Rect) -> Rect {
    let newX: Double
    let newY: Double
    let newW: Double
    let newH: Double
    
    let aXBegin = a.origin.x
    let aXEnd = aXBegin + a.size.width
    let aYBegin = a.origin.y
    let aYEnd = aYBegin + a.size.height
    
    let bXBegin = b.origin.x
    let bXEnd = bXBegin + b.size.width
    let bYBegin = b.origin.y
    let bYEnd = bYBegin + b.size.height
    
    if (bXBegin <= aXBegin) && (bXEnd >= aXEnd) && (bYBegin <= aYBegin) && (bYEnd >= aYEnd) {
        newX = aXBegin
        newY = aYBegin
        newH = 0
        newW = 0
    } else if (((bXEnd > aXBegin) && (bXEnd < aXEnd)) || ((bXBegin > aXBegin) && (bXBegin < aXEnd))) && (((bYEnd > aYEnd) && (bYEnd < aYEnd)) || ((bYBegin > aYBegin) && (bYBegin < aYEnd))) {
        newX = (bXEnd > aXBegin) && (bXEnd < aXEnd) ? bXEnd : aXBegin
        newY = (bYEnd > aYBegin) && (bYEnd < aYEnd) ? bYEnd : aYBegin
        newH = ((bYBegin > aYBegin) && (bYBegin < aYEnd) ? bYBegin : aYEnd) - newY
        newW = ((bXBegin > aXBegin) && (bXBegin < aXEnd) ? bXBegin : aXEnd) - newX
    } else {
        newX = aXBegin
        newY = aYBegin
        newW = aXEnd - aXBegin
        newH = aYEnd - aYBegin
    }
    
    return Rect(x: newX, y: newY, height: newH, weight: newW)
}

func -= (a: inout Rect, b: Rect) {
    a = a - b
}

var s1 = Rect(x: 1.0, y: 1.0, height: 2.0, weight: 2.0)
var s2 = Rect(x: 5.0, y: 5.0, height: 2.0, weight: 2.0)

var s3 = s1 + s2
s3
s1 += s2
s1
s3 = s1 - s2
s3
s3 -= s1
s3

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

func + (s1: inout String, s2: Int) {
    s1 += String(s2)
}

func += (s1: inout String, i: Int) {
    s1 += String(i)
}

var s = "Hello, World!"

s + 777
s = "Hello, World!"
s += 777

infix operator +==+

func +==+ (a: String, b: String) -> String {
    let set = Set(b.characters)
    var str = Array(a.characters)
    for i in 0..<str.count {
        if set.contains(str[i]) {
            str[i] = Character(String(str[i]).uppercased())
        }
    }
    return String(str)
}

s = "Hello, World!"
s +==+ "l"
