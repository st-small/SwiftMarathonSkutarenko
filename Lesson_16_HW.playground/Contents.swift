import UIKit

/*
 1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У него есть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате
 
 2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз
 Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически
 
 3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.
 
 4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)
 
 5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте :)
 
 Для суперменов: можете добавить массив ящиков и можете сделать консольное приложение
 */

class Room {
    
    var height = 6
    var width = 6
    
    lazy var human = Human(x: 0, y: 0)
    lazy var box = Box(x: 4, y: 3)
    lazy var door = Exit(x: 6, y: 4)
    
    func humanMove(move: Direction) {
        switch move {
        case .Up:
            if human.y == 1 {
                print("No way!")
            } else if box.y == (human.y - 1) && (box.y - 1) != 0 && box.x == human.x || (box.y - 1) == door.y {
                human.y -= 1
                box.y -= 1
            } else {
                human.y -= 1
            };
        case .Down:
            if human.y == 5 {
                print("No way!")
            } else if box.y == (human.y + 1) && (box.y + 1) != self.height && box.x == human.x || (box.y + 1) == door.y {
                human.y += 1
                box.y += 1
            } else {
                human.y += 1
            };
        case .Left:
            if human.x == 1 {
                print("No way!")
            } else if box.x == (human.x - 1) && (box.x - 1) != 0 && box.y == human.y || (box.x - 1) == door.x {
                human.x -= 1
                box.x -= 1
            } else {
                human.x -= 1
            };
        case .Right:
            if human.x == 5 {
                print("No way!")
            } else if box.x == (human.x + 1) && (box.x + 1) != self.width && box.y == human.y || (box.x + 1) == door.x {
                human.x += 1
                box.x += 1
            } else {
                human.x += 1
            };
        }
    }
    
    func printWinAlert() {
    print("***************************\n**** CONGRATULATIONS! *****\n***************************")
    }
    
    func pole() {
        var str = ""
        for i in 0...self.height {
            for j in 0...self.width {
                switch (j, i) {
                case (human.x, human.y):
                    str.append(Human.img)
                case (box.x, box.y):
                    str.append(Box.img)
                case (door.x, door.y):
                    str.append(Exit.img)
                case (j, i) where i == 0 || i == self.height || j == 0 || j == self.width:
                    str.append("⬛")
                default:
                    str.append("⬜")
                }
            }
            print(str)
            str = ""
        }
        if box.x == door.x && box.y == door.y {
            printWinAlert()
        }
    }
}

class Human {
    var x : Int
    var y : Int
    static var img = "👨"
    init(x: Int, y: Int) {
        self.x = x > 1 ? x : 1
        self.y = y > 1 ? y : 1
    }
}

class Box {
    var x : Int
    var y : Int
    static var img = "📦"
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

class Exit {
    var x : Int
    var y : Int
    static var img = "🚪"
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

enum Direction {
    case Up
    case Down
    case Left
    case Right
}

let r = Room()
r.human.x = 2
r.human.y = 2
r.pole()

r.humanMove(move: .Up)
r.pole()

r.humanMove(move: Direction.Right)
r.pole()

r.humanMove(move: Direction.Right)
r.pole()

r.humanMove(move: Direction.Down)
r.pole()

r.humanMove(move: Direction.Down)
r.pole()

r.humanMove(move: Direction.Left)
r.pole()

r.humanMove(move: Direction.Down)
r.pole()

r.humanMove(move: Direction.Right)
r.pole()

r.humanMove(move: Direction.Right)
r.pole()

