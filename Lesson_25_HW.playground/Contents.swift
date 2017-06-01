import UIKit

/*
 1. Расширьте енум из урока и добавьте в него метод, помогающий установить соответствующий бит в переданную маску и метод, помогающий его прочитать. Эти методы должны принимать и возвращать маску, либо принимать адрес маски и менять его
 
 2. Создать цикл, который будет выводить 1 байтное число с одним установленным битом в такой последовательности, чтобы в консоли получилась вертикальная синусоида
 
 3. Создайте 64х битное число, которое представляет клетки на шахматной доске. Установите биты так, что 0 - это белое поле, а 1 - черное. Младший бит это клетка а1 и каждый следующий байт начинается с клетки а (а2, а3, а4) и заканчивается клеткой h(h2, h3, h4). Выбирая клетки но индексу столбца и строки определите цвет клетки опираясь исключительно на значение соответствующего бита
 */

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

extension Int {
    
    func binary() -> String {
        var result = ""
        for i in 0..<64 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

print("\nExcercise 1")

enum CheckList: UInt8 {
    case Bread      = 0b000000001
    case Chicken    = 0b000000010
    case Apples     = 0b000000100
    case Pears      = 0b000001000
}

extension CheckList {
    static func whatSet(_ checkList: UInt8) -> [CheckList] {
        var result = [CheckList]()
        if (checkList & CheckList.Bread.rawValue) > 0 { result.append(.Bread)}
        if (checkList & CheckList.Chicken.rawValue) > 0 { result.append(.Chicken)}
        if (checkList & CheckList.Apples.rawValue) > 0 { result.append(.Apples)}
        if (checkList & CheckList.Pears.rawValue) > 0 { result.append(.Pears)}
        return result
    }
    
    static func setItems(_ checkArray: [CheckList], _ checkList: UInt8) -> UInt8 {
        var result = checkList
        for check in checkArray {
            result |= check.rawValue
        }
        return result
    }
    
    static func clearItems(_ checkArray: [CheckList], _ checkList: UInt8) -> UInt8 {
        var result = checkList
        for check in checkArray {
            result &= ~check.rawValue
        }
        return result
    }
}
    
print("CheckList contains:")
var checkList : UInt8 = 0b0000_1001
for i in CheckList.whatSet(checkList) {
    print(i)
}

print("\nAdded Apples:")
checkList = CheckList.setItems([.Apples], checkList)
for i in CheckList.whatSet(checkList) {
    print(i)
}

print("\nRemoved Bread, Pears and Chicken:")
checkList = CheckList.clearItems([.Bread, .Pears, .Chicken], checkList)
for i in CheckList.whatSet(checkList) {
    print(i)
}

print("\nExcercise 2")

var a: UInt8 = 0b00000001
print(a.binary())
for i in 0...100 {
    let j = (i % 14) + 1
    switch j {
    case 1...7: a = a << 1; print(a.binary())
    case 8...14: a = a >> 1; print(a.binary())
    default: a = a >> 1; print(a.binary())
    }
}

print("\nExcercise 3")

var board = 0
for column in 0...7 {
    for row in 0...7 {
        if (column + row) % 2 == 0 {
            let temp = 1 << (column * 8 + row)
            board |= temp
        }
    }
}

let columnDict = ["a" : 1, "b" : 2, "c" : 3, "d" : 4,
                  "e" : 5, "f" : 6, "g" : 7, "h" : 8]

func showColor(_ board: Int, _ coordinate: (String, Int)) -> String {
    let column = columnDict[coordinate.0]!
    let row = coordinate.1
    var color = ""
    if board & (1 << (column * 8 + row-1)) != 0 {
        color = "White"
    } else {
        color = "Black"
    }
    return "The square with coordinates (\(coordinate.0)-\(coordinate.1)) has \(color) color"
}

print(showColor(board, ("a",1)))
print(showColor(board, ("a",2)))
print(showColor(board, ("a",3)))
print(showColor(board, ("a",4)))
print(showColor(board, ("a",5)))
print(showColor(board, ("a",6)))
print(showColor(board, ("a",7)))
print(showColor(board, ("a",8)))
print(showColor(board, ("b",1)))
print(showColor(board, ("b",2)))
print(showColor(board, ("b",3)))
print(showColor(board, ("b",4)))
print(showColor(board, ("b",5)))
print(showColor(board, ("b",6)))
print(showColor(board, ("b",7)))
print(showColor(board, ("b",8)))
print(showColor(board, ("d",4)))

