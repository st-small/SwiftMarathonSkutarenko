import UIKit

/*
 1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает . Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.
 
 2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.
 
 3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную.
 
 используя этот метод и этот клоужер найдите максимальный и минимальный элементы массива.
 
 4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы
 
 5. Проделайте задание №3 но для нахождения минимальной и максимальной буквы из массива букв (соответственно скалярному значению)
 */

func printInLoop(closure: ()->()) {
    
    for i in 1...10 {
        print(i)
    }
    print("closure")
    closure()
}

printInLoop{print("closure2")}

print("\n**********************\n")

var array = [Int]()

for i in 0..<100 {
    let random = Int(arc4random_uniform(2000)) - 1000
    array.append(random)
}

array.sort(by: <)
array.sort(by: >)

print("\n**********************\n")

func customFunc(array: [Int], closure: (Int, Int?) -> Bool) -> Int {
    
    var optional : Int?
    for value in array {
        if optional == nil || closure(value, optional) {
            optional = value
        }
    }
    
    return optional!
}

print("min = \(customFunc(array: array) {$0 < $1!})")
print("max = \(customFunc(array: array) {$0 > $1!})")

print("\n**********************\n")

let str = "asdgsddashgwreiil;mm,ncdagdsaopep[o!^&**$#"

var arrayChars = String(str.characters)
var dictChars = [String:Int]()

for char in arrayChars.characters {
    let char = String(char)
    if dictChars[char] == nil {
        switch char {
        case "a", "e", "i", "o", "u", "y": dictChars[char] = 1
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z": dictChars[char] = 2
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9": dictChars[char] = 3
        case "!", "&", "?", ".", ",", "/": dictChars[char] = 4
        default: dictChars[char] = 5
        }
    }
}

arrayChars = arrayChars {str1, str2 in

}
