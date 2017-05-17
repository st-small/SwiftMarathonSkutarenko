import UIKit

/*
 1. Выполните задание #1 урока о базовых операторах: (Выведите в консоль минимальные и максимальные значения базовых типов) только вместо forced unwrapping и optional binding используйте оператор ??
 
 Когда посчитаете сумму, то представьте свое выражение в виде строки
 Например: 5 + nil + 2 + 3 + nil = 10
 
 но в первом случае используйте интерполяцию строк, а во втором конкатенацию
 
 2. Поиграйтесь с юникодом и создайте строку из 5 самых классных по вашему мнению символов,
 можно использовать составные символы. Посчитайте длину строки методом SWIFT и Obj-C
 
 3. Создайте строку английский алфавит, все буквы малые от a до z
 
 задайте константу - один из символов этого алфавита
 
 Используя цикл for определите под каким индексов в строке находится этот символ
 */

let a = "abc"
let b = "123"
let c = "def"
let d = "456"
let e = "ghi"

var f = Int(a) ?? 0
var g = Int(b) ?? 0
var h = Int(c) ?? 0
var i = Int(d) ?? 0
var j = Int(e) ?? 0

let sum = f + g + h + i + j

let str1 = Int(a) != nil ? a : "nil"
let str2 = Int(b) != nil ? b : "nil"
let str3 = Int(c) != nil ? c : "nil"
let str4 = Int(d) != nil ? d : "nil"
let str5 = Int(e) != nil ? e : "nil"

let sumStringInterpol = "\(str1) + \(str2) + \(str3) + \(str4) + \(str5) = \(sum)"
let sumStringConcat = "\(str1) + " + "\(str2) + " + "\(str3) + " + "\(str4) + " + "\(str5) = " + "\(sum)"

print(sumStringInterpol)
print(sumStringConcat)

print("\n*******************************\n")

let de = "\u{1F1E9}\u{1F1EA}"
let usa = "\u{1F1fa}\u{1F1f8}"
let rus = "\u{1F1f7}\u{1F1fa}"
let christmasTree = "\u{1f384}"
let family = "\u{1f468}\u{200d}\u{1F469}\u{200D}\u{1F467}\u{200D}\u{1F466}"

let complexString = "\(de) + \(usa) + \(rus) = \(christmasTree) + \(family)"

print(complexString)

complexString.characters.count
(complexString as NSString).length

print("\n*******************************\n")

let alphabet = "abcdefghijklmnopqrstuvwxyz"
alphabet.characters.count

let const : Character = "c"
let index = 0
for (index, char) in alphabet.characters.enumerated() {
    if char == const {
        print(index)
    }
}





