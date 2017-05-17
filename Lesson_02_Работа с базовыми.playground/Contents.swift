
import UIKit

//let bigNumber = 1_863_215_371_232

//let oct = 0o12 // восмеричное исчисление

let number  = 255 // десятиричное исчисление
let hex     = 0xff // 16-ричное исчисление
let binary  = 0b1111_1111 // двоичное

Int8.min
Int8.max
UInt8.min
UInt8.max

13.3123e2 // == 13.3123 * (10 в степени 2 (или 100))
13.3123e-2 // == 13.3123 / (10 в степени 2 (или 100))

0x5p2 // == 5 * (2 в степени 2 (или 4))
0x5p-2 // == 5 / (2 в степени 2 (или 4))

let a = 5
let b = 5.2

let c = a + Int(b)
let d = Double(a) + b

let e = 5 + 5.2

let f : Float = 5.0
let g = 5.2

let h = Double(f) + g

typealias AlexNumber = Int

let i : AlexNumber = 5
let j = 5.2

let k = i + AlexNumber(j)

let l = false

if l {
    print("Hi!")
} else {
    print("Bye!")
}
		