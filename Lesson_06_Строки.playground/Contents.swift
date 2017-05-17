import UIKit

//var str = String()
var str = "c"

str = str + "a"
str += "b"

var a = 5
var b = a

a += 1
b

var str1 = "a"
var str2 = str1

str1
str2

str1 = "b"

str1
str2

str1.isEmpty

let char1 : Character = "x"

for char in ("Hello world!").characters {
    print(char)
}

str1.append(char1)

(str1 as NSString).length
NSString(string: str1).length

let heart = "\u{1F496}"

let eAcute : Character = "\u{E9}"
let combinedEAcute : Character = "e\u{301}"

var fun : Character = "ъ\u{301}\u{20dd}"

let funString = "what is this? -> \(fun)"

funString.characters.count
(funString as NSString).length

if funString == "aa" {
    
} else {
    print("not equal")
}

funString.hasPrefix("what")
funString.hasSuffix("ъ")
funString.hasSuffix("ъ\u{301}\u{20dd}")

