import UIKit

/*
 1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.
 
 2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль
 
 3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.
 
 4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?
 
 5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)
 */

func man() -> String {
    return "\u{1f468}"
}

func woman() -> String {
    return "\u{1f469}"
}

func kiss() -> String {
    return "\u{1f48f}"
}

func love() -> String {
    return "\u{2764}"
}

func child() -> String {
    return "\u{1f476}"
}

func family() -> String {
    return "\u{1f468}\u{200D}\u{1f469}\u{200D}\u{1f466}"
}

print((man()) + (woman()) + "= " + (kiss()) + ". After " + (kiss()) + (love()) + " = " + (child()) + ". They are " +  (family()))

print("\n***********************\n")

func checkChessSquareColor(number: Int, symbol: String) -> String {
    
    if (number % 2 == 1) && (symbol == "a" || symbol == "c" || symbol == "e" || symbol == "g") || (number % 2 == 0) && !(symbol == "a" || symbol == "c" || symbol == "e" || symbol == "g") {
       
        return "The square \(number)\(symbol) has black color"
        
    } else {
       
        return "The square \(number)\(symbol) has white color"
    }
}

print(checkChessSquareColor(number: 2, symbol: "e"))

print("\n***********************\n")

func reverseArray(array: [Int]) -> [Int] {
    
    var arrayUpd = [Int]()
    
    for element in array.reversed() {
        arrayUpd.append(element)
    }
    
    return arrayUpd
}

func reverseSequence(sequence: Int...) -> [Int] {
    
    var array = [Int]()
    for value in sequence {
        array.append(value)
    }
    
    return reverseArray(array: array)
}


var array = [1,2,3,4,5]

reverseArray(array: array)

reverseSequence(sequence: 6,7,8,9)

print("\n***********************\n")

func reverseArrayUsingInOut(array: inout [Int]) {
    
    array = array.reversed()
    
}

func reverseSequenceUsingInOut(sequence: Int...) {
    
    var array = [Int]()
    for value in sequence {
        array.append(value)
    }
    
    reverseArrayUsingInOut(array: &array)
}

reverseArrayUsingInOut(array: &array)

reverseSequence(sequence: 6,7,8,9)

print("\n***********************\n")

let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ullamcorper nibh justo, in interdum augue pharetra vitae. Maecenas a dui a erat sodales luctus. Vestibulum eget iaculis magna, sed pellentesque purus. Nunc mattis diam magna, at auctor nisi convallis non. Proin sem ex, dictum quis lectus suscipit, malesuada posuere dui. Sed at viverra dolor. Morbi id augue eu quam porta gravida. Donec blandit leo ut pellentesque congue. Suspendisse tincidunt faucibus augue, quis ultricies magna tempus quis. In in nunc porttitor, posuere ligula a, accumsan nulla. Pellentesque neque dui, feugiat in lorem at, aliquet bibendum sem. Vivamus dui nunc, congue id nisi sit amet, accumsan varius lectus. Donec sit amet felis feugiat, convallis lacus in, viverra metus. Duis tellus elit, pellentesque id lobortis non, aliquam eleifend leo. Etiam in tempor urna. Aenean eget est porttitor, scelerisque libero ut, maximus elit. 08/05/2017"

func digitFormatter(digit: String) -> String {
    
    switch digit {
    case "0": return "zero"
    case "1": return "one"
    case "2": return "two"
    case "3": return "three"
    case "4": return "four"
    case "5": return "five"
    case "6": return "six"
    case "7": return "seven"
    case "8": return "eight"
    case "9": return "nine"
    default: break
    }
    
    return ""
}

func textFormatter(text: String) -> String {
    
    var formattedText = ""
    var tempString = ""
    
    for char in text.characters {
        switch char {
        case "a", "e", "i", "o", "u", "y": tempString = (String(char)).capitalized
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z": tempString = String(char)
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9": tempString = digitFormatter(digit: String(char))
        case "!", "&", "?", ".", ",", "/": tempString = " "
        default: tempString = String(char)
        }
        formattedText.append(tempString)
    }
    
    return formattedText
}

print(textFormatter(text: text))




