import UIKit

/*
 
 1. Создайте расширение для Int с пропертисами isNegative, isPositive, bool
 
 2. Добавьте проперти, которое возвращает количество символов в числе
 
 3. Добавьте сабскрипт, который возвращает символ числа по индексу:
 
 let a = 8245
 
 a[1] // 4
 a[3] // 8
 
 Профи могут определить и сеттер :)
 
 4. Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его
 
 5. Добавить стрингу метод truncate, чтобы отрезал лишние символы и , если таковые были, заменял их на троеточие:
 
 let s = "Hi hi hi"
 
 s.truncate(4) // Hi h...
 
 s.truncate(10) // Hi hi hi
 
 */

extension Int {
    
    var isNegative : Bool {
        
        return self < 0
    }
    
    var isPositive : Bool {
        
        return !isNegative
    }
    
    var countNumerals: Int {
        return String(self).characters.count
    }
    
    subscript(number: Int) -> Int? {
        get {
            if number < 0 || (String(self).characters.count - 1) < number {
                return nil
            } else {
                var decimal = 1
                for _ in 0..<number {
                    decimal *= 10
                }
                return (self / decimal) % 10
            }
        }
        set {
            var newVal = newValue!
            let charsCount = String(describing: newVal).characters.count
            if charsCount > (number + 1) {
                for _ in 0..<charsCount - (number + 1) {
                    newVal /= 10
                }
            }
            var leftNumber = self
            var rightNumber: Int?
            var symb: Int = 0
            var order = 1
            var order2 = 1
            for i in 0...number {
                symb = leftNumber % 10
                leftNumber /= 10
                if i <= (number - charsCount) {
                    rightNumber = rightNumber != nil ? rightNumber! + symb * order : symb
                    order2 *= 10
                }
                order *= 10
            }
            self = leftNumber * order + newVal * order2 + (rightNumber ?? 0)
        }
        
    }
}

extension String {
    
    subscript(r: CountableRange<Int>) -> String {
        get {
            let start = index(startIndex, offsetBy: r.lowerBound)
            let end = index(startIndex, offsetBy: r.upperBound - r.lowerBound)
            return self[Range(start..<end)]
        }
        set {
            let start = index(startIndex, offsetBy: r.lowerBound)
            let end = index(startIndex, offsetBy: r.upperBound - r.lowerBound)
            self.replaceSubrange(start..<end, with: newValue)
        }
    }
    
    func truncate(_ length: Int) -> String {
        if length >= self.characters.count {
            return self
        } else {
            let index = self.index(self.startIndex, offsetBy: length)
            return self.substring(to: index) + "..."
        }
    }
}

var a = 12345

a.isNegative
a.isPositive
a.countNumerals

a[3] = 5
a

var s = "What a wonderful day!"
s[0..<4] = "Yesterday was"
s
s.truncate(5)
s.truncate(10)
s.truncate(20)