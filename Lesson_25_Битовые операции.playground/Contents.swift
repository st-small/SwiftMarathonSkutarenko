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

var a: UInt8 = 0b00110011
var b: UInt8 = 0b11100001

a.binary()
b.binary()
(a | b).binary()

a.binary()
b.binary()
(a & b).binary()





