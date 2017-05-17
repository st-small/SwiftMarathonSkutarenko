import UIKit

let total = 5 + 6 - 8 * 3 - 5 / 10 //+ ++5 + --7 - 5-- + 7++

let div  = 10 / 3
let rest = 10 % 3

43345342675342 % 101

var small : UInt8 = 0xff

// &+, &*, &/, &-, &%
small = small &+ 5

let str = "Hi, " + "there!"

var a = 5
var b = 6

// >, <, >=, <=, ==, !=
if a >= b {
    
    print("yes")
    
} else {
    
    print("no")
}

var c : Int

if a < b {
    c = a
} else {
    c = b
}

c = a < b ? a : b

let text = "123"

let n = Int(text)

// 1 способ
if n != nil {
    c = n!
} else {
    c = 0
}

// 2 способ
if let opt = n {
    c = opt
} else {
    c = 0
}

// 3 способ
c = n ?? 0

var sum = 5
sum = sum + 1
sum += 1

var good = true
good = !good

// && = *, || = +, !=

if good {
    print("good")
} else {
    print("bad")
}

//true && true = true
//true && false = false
//false && true = false
//false && false = false
//
//true || true = true
//true || false = true
//false || true = true
//false || false = false

let i = 5
let j = 6
let k = 7
let m = 8

if (i < 3) && (j > k) && (m != k) || m > i {
    
}

0...5
0..<5

for i in 0..<5 {
    print(i)
}














