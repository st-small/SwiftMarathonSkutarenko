
/*
1. Выведите в консоль минимальные и максимальные значения базовых типов, не ленитесь :)

2. Создайте 3 константы с типами Int, Float и Double

Создайте другие 3 константы, тех же типов: Int, Float и Double,

при чем каждая из них это сумма первых трех, но со своим типом

3. Сравните Int результат суммы с Double и выведите отчет в консоль
*/

import UIKit

print("Диапазон UInt от \(UInt.min) до \(UInt.max)")
print("Диапазон UInt8 от \(UInt8.min) до \(UInt8.max)")
print("Диапазон UInt16 от \(UInt16.min) до \(UInt16.max)")
print("Диапазон UInt32 от \(UInt32.min) до \(UInt16.max)")
print("Диапазон UInt64 от \(UInt64.min) до \(UInt64.max)")
print("Диапазон Int от \(Int.min) до \(Int.max)")


let a : Int = 10
let b : Float = 100.11
let c : Double = 150.50

let aAnother : Int = a + Int(b) + Int(c)
let bAnother : Float = Float(a) + b + Float(c)
let cAnother : Double = Double(a) + Double(b) + c

Double(aAnother) > cAnother ? print("aAnother больше cAnother на \(aAnother - Int(cAnother))") : print("aAnother меньше cAnother на \(cAnother - Double(aAnother))")




