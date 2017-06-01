import UIKit

extension UInt8 {
    
    func binary() -> String {
        var result = ""
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

extension Int8 {
    
    func binary() -> String {
        var result = ""
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}
/*
var a: UInt8 = 57
a.binary()

/*
0b11111111
0xff
255
*/

a = a + 2
a.binary()
a += 3
a.binary()

a = 0b00111001
a.binary()
(5 as UInt8).binary()
a = a + 0b00000101
a.binary()
(4 as UInt8).binary()
a -= 0b00000100
a.binary()

//a = a << 1
//a.binary()
//a = a << 1
//a.binary()
//a = a << 1
//a.binary()
//a = a << 1
//a.binary()


//a = a >> 1
//a.binary()
//a = a >> 1
//a.binary()
//a = a >> 1
//a.binary()
//a = a >> 1
//a.binary()
//a = a >> 1
//a.binary()
//a = a >> 1
//a.binary()
a = a * 4
a = a &* 2
a.binary()

a = 0b11111111
a = a &+ 1

a = 0b00000000
a = a &- 1

var b: Int8 = 57
b.binary()

b = 0b01111111
b.binary()
b = b &+ 1
b.binary()
b = b &+ 1
b.binary()

b = 0
b = b - 1
b.binary()
b = b - 1
b.binary()

b = 0b00100001
b = b << 2

b = 0
*/

//**************************

var a: UInt8 = 0b00110011 // 51
var b: UInt8 = 0b11100001 // 225
var c = 0

a.binary()
b.binary()
(a | b).binary() // 243

a.binary()
b.binary()
(a & b).binary() // 33

a.binary()
b.binary()
(a ^ b).binary() // 210

a.binary()
(~a).binary()

// проверка установки бита, если рузальтат == b, то оба, если результат, просто > 0, то какой-то из них, ХЗ какой
b = 0b00010001
a.binary()
b.binary()
(a & b).binary()

// установка нужного бита в любом случае (если нет его, то установить; если установлен, то положение не изменится)
b = 0b00000100
a.binary()
b.binary()
(a | b).binary()

// установка нужного бита в инверсии (если нет его, то установить; если установлен, то убрать)
a.binary()
b.binary()
(a ^ b).binary()

// как сбросить бит числа
b = 0b00010000
a.binary()
(~b).binary()
(a & ~b).binary()

enum CheckList: UInt8 {
    case Bread      = 0b000000001
    case Chicken    = 0b000000010
    case Apples     = 0b000000100
    case Pears      = 0b000001000
}

let checkList: UInt8 = 0b00001001

let bread = checkList & CheckList.Bread.rawValue
bread.binary()

let chicken = checkList & CheckList.Chicken.rawValue
chicken.binary()

let pears = checkList & CheckList.Pears.rawValue
pears.binary()








