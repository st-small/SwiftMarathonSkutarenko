import UIKit

/*
 Шахматная доска (Легкий уровень)
 
 1. Создайте тип шахматная доска.
 2. Добавьте сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра).
 3. Если юзер ошибся координатами - выдавайте нил
 
 Крестики нолики (Средний уровень)
 
 1. Создать тип, представляющий собой поле для игры в крестики нолики
 На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик
 Добавьте возможность красиво распечатывать поле
 2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу,
 причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.
 3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.
 4. Если хотите, добавте алгоритм, который вычислит победителя
 
 Морской бой (Тяжелый уровень)
 
 1. Создайте тип корабль, который будет представлять собой прямоугольник. В нем может быть внутренняя одномерная система координат (попахивает сабскриптом). Корабль должен принимать выстрелы по локальным координатам и вычислять когда он убит
 2. Создайте двумерное поле, на котором будут располагаться корабли врага. Стреляйте по полю и подбейте вражеский четырех трубник :)
 3. Сделайте для приличия пару выстрелов мимо, красивенько все выводите на экран :)
 */

struct ChessBoardSquare {
    
    subscript(column: String, row: Int) -> String? {

        switch (column, row) {
        case (column, row) where (row % 2 == 1) && column == "a" || column == "c" || column == "e" || column == "g": return "Black"
        case (column, row) where (row % 2 == 0) && column == "a" || column == "c" || column == "e" || column == "g": return "White"
        case (column, row) where (row % 2 == 1) && column == "b" || column == "d" || column == "f" || column == "h": return "White"
        case (column, row) where (row % 2 == 0) && column == "b" || column == "d" || column == "f" || column == "h": return "Black"
        default: return nil
        }
        
    }
}

var square = ChessBoardSquare()
square["a", 1]
square["b", 8]
square["d", 7]
square["r", 8]


enum BlockImg: String {
    case empty = "⬜"
    case cross = "❌"
    case circle = "⭕"
}

class Block {
    var x: Int
    var y: Int
    var img = BlockImg.empty
    
    init(x: Int, y:Int) {
        self.x = x
        self.y = y
    }
}

class TicTacToe {
    var arr = [Block]()
    
    init() {
        for i in 0...2 {
            for j in 0...2 {
                arr.append(Block(x: j, y: i))
            }
        }
    }
    
    func printField() {
        var str = ""
        for i in 0...4 {
            for j in 0...4 {
                switch (i, j) {
                case (i, j) where i == 0 || i == 4 || j == 0 || j == 4:
                    str.append("⬛")
                default:
                    if i == 1 {
                        str.append(arr[(i + j) - 2].img.rawValue)
                    } else if i == 2 {
                        str.append(arr[i + j].img.rawValue)
                    } else if i == 3 {
                        str.append(arr[(i + j) + 2].img.rawValue)
                    }
                }
            }
            print(str)
            str = ""
        }
    }
    
    func findUpperOrLower(x: Int, y: Int) -> String {
        for block in arr {
            if block.x == x && block.y == y {
                return block.img.rawValue
            }
        }
        
        return BlockImg.empty.rawValue
    }
    
    func newGame() {
        for block in arr {
            block.img = BlockImg.empty
        }
        
        self.printField()
    }
    
    subscript(x: Int, y: Int) -> String {
        get {
            for block in arr {
                if block.x == x && block.y == y {
                    return "The Block (\(block.x), \(block.y)) has \(block.img.rawValue) value"
                }
            }
            
            return "??"
        }
        
        set {
            if (0...3).contains(x) && (0...3).contains(y) {
                for block in arr {
                    if block.x == x && block.y == y {
                        if block.img == BlockImg.empty {
                            block.img = BlockImg(rawValue: newValue)!
                        } else {
                            print("\nYou can't set this block. It's value is not empty! It has \(block.img)\n")
                        }
                    }
                }
                
                print("The Block (\(x), \(y)) has \(newValue) value\n*****************************")
                
            } else {
                print("\nWrong value! The x or y position is out of range!\n")
            }
            
            self.printField()
            
            switch newValue {
                // "\"
            case _ where self.findUpperOrLower(x: x + 1, y: y + 1) == newValue && self.findUpperOrLower(x: x - 1, y: y - 1) == newValue :
                print("\(newValue) wins!")
            case _ where self.findUpperOrLower(x: x + 1, y: y + 1) == newValue && self.findUpperOrLower(x: x + 2, y: y + 2) == newValue :
                print("\(newValue) wins!")
            case _ where self.findUpperOrLower(x: x - 1, y: y - 1) == newValue && self.findUpperOrLower(x: x - 2, y: y - 2) == newValue :
                print("\(newValue) wins!")
                
                // "/"
            case _ where self.findUpperOrLower(x: x - 1, y: y + 1) == newValue && self.findUpperOrLower(x: x - 2, y: y + 2) == newValue :
                print("\(newValue) wins!")
            case _ where self.findUpperOrLower(x: x + 1, y: y + 1) == newValue && self.findUpperOrLower(x: x - 1, y: y - 1) == newValue :
                print("\(newValue) wins!")
            case _ where self.findUpperOrLower(x: x - 1, y: y - 1) == newValue && self.findUpperOrLower(x: x - 2, y: y - 2) == newValue :
                print("\(newValue) wins!")
                
                // "_"
            case _ where self.findUpperOrLower(x: x + 1, y: y) == newValue && self.findUpperOrLower(x: x + 2, y: y) == newValue :
                print("\(newValue) wins!")
            case _ where self.findUpperOrLower(x: x - 1, y: y) == newValue && self.findUpperOrLower(x: x + 1, y: y) == newValue :
                print("\(newValue) wins!")
            case _ where self.findUpperOrLower(x: x - 1, y: y) == newValue && self.findUpperOrLower(x: x - 2, y: y) == newValue :
                print("\(newValue) wins!")
                
            // "|"
            case _ where self.findUpperOrLower(x: x, y: y + 1) == newValue && self.findUpperOrLower(x: x, y: y + 2) == newValue :
                print("\(newValue) wins!")
            case _ where self.findUpperOrLower(x: x, y: y - 1) == newValue && self.findUpperOrLower(x: x, y: y + 1) == newValue :
                print("\(newValue) wins!")
            case _ where self.findUpperOrLower(x: x, y: y - 1) == newValue && self.findUpperOrLower(x: x, y: y - 2) == newValue :
                print("\(newValue) wins!")
                
            default: break
            }
            
        }
        
    }
}

var TTT = TicTacToe()
//TTT.arr
//
//TTT[1,1] = BlockImg.circle.rawValue
//
//TTT[1,1] = BlockImg.cross.rawValue
//
//TTT[5,5] = BlockImg.cross.rawValue
//
//TTT[2,2] = BlockImg.circle.rawValue
//TTT[0,0] = BlockImg.circle.rawValue
//
//TTT.newGame()
//TTT[0,2] = BlockImg.circle.rawValue
//TTT[1,1] = BlockImg.circle.rawValue
//TTT[2,0] = BlockImg.circle.rawValue
//
//TTT.newGame()
//TTT[0,0] = BlockImg.cross.rawValue
//TTT[1,0] = BlockImg.cross.rawValue
//TTT[2,0] = BlockImg.cross.rawValue
//
//TTT.newGame()
//TTT[0,0] = BlockImg.cross.rawValue
//TTT[0,1] = BlockImg.cross.rawValue
//TTT[0,2] = BlockImg.cross.rawValue

TTT.newGame()
TTT[1,0] = BlockImg.cross.rawValue
TTT[1,1] = BlockImg.circle.rawValue
TTT[2,0] = BlockImg.cross.rawValue
TTT[0,0] = BlockImg.circle.rawValue
TTT[2,2] = BlockImg.cross.rawValue
TTT[2,1] = BlockImg.cross.rawValue





