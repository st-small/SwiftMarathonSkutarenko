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
    var img = "⬜"
    
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
                arr.append(Block(x: i, y: j))
            }
        }
    }
    
    func printField() {
        var str = ""
        for i in 0...4 {
            for j in 0...4 {
                switch (j, i) {
                case (j, i) where i == 0 || i == 4 || j == 0 || j == 4:
                    str.append("⬛")
                default:
                    str.append(arr[i+j].img)
                }
            }
            print(str)
            str = ""
        }
    }
    
    subscript
}

var TTT = TicTacToe()
TTT.arr
TTT.printField()







