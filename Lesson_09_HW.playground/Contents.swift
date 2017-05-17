import UIKit

/*
 1. Создать строку произвольного текста, минимум 200 символов. Используя цикл и оператор свитч посчитать количество гласных, согласных, цифр и символов.
 
 2. Создайте свитч который принимает возраст человека и выводит описание жизненного этапа
 
 3. У вас есть имя отчество и фамилия студента (русские буквы). Имя начинается с А или О, то обращайтесь к студенту по имени, если же нет, то если у него отчество начинается на В или Д, то обращайтесь к нему по имени и отчеству, если же опять нет, то в случае если фамилия начинается с Е или З, то обращайтесь к нему только по фамилии. В противном случае обращайтесь к нему по полному имени.
 
 4. Представьте что вы играете в морской бои и у вас осталось некоторое количество кораблей на поле 10Х10 (можно буквы и цифры, а можно только цифры). Вы должны создать свитч, который примет тюпл с координатой и выдаст один из вариантов: мимо, ранил, убил.
 */

let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ullamcorper nibh justo, in interdum augue pharetra vitae. Maecenas a dui a erat sodales luctus. Vestibulum eget iaculis magna, sed pellentesque purus. Nunc mattis diam magna, at auctor nisi convallis non. Proin sem ex, dictum quis lectus suscipit, malesuada posuere dui. Sed at viverra dolor. Morbi id augue eu quam porta gravida. Donec blandit leo ut pellentesque congue. Suspendisse tincidunt faucibus augue, quis ultricies magna tempus quis. In in nunc porttitor, posuere ligula a, accumsan nulla. Pellentesque neque dui, feugiat in lorem at, aliquet bibendum sem. Vivamus dui nunc, congue id nisi sit amet, accumsan varius lectus. Donec sit amet felis feugiat, convallis lacus in, viverra metus. Duis tellus elit, pellentesque id lobortis non, aliquam eleifend leo. Etiam in tempor urna. Aenean eget est porttitor, scelerisque libero ut, maximus elit. 08/05/2017"

var vowel = 0
var consonant = 0
var numbers = 0
var symbol = 0


for char in text.characters {
    switch char {
    case "a", "e", "i", "o", "u", "y": vowel += 1
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z": consonant += 1
    case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9": numbers += 1
    case "!", "&", "?", ".", ",", "/": symbol += 1
    default: break
    }
}

print("There are \(vowel) vowels &\n\(consonant) consonants &\n\(numbers) numbers &\n\(symbol) other symbols in text!")

print("\n***********************\n")

let age = 87

switch age {
    case 0..<5:     print("Baby")
    case 5..<13:    print("Children")
    case 13..<18:   print("Teen")
    case 18..<25:   print("Student")
    case 25..<55:   print("Adult")
    case 55..<65:   print("Senior")
    case 65..<90:   print("Old")
    
    default: break
}

let array = ["Иван", "Петр", "Сидор", "Семен", "Олег", "Степан", "Антон", "Остап", "Вадим", "Захар", "Егор", "Данил"]

var studentsArray: [(name: String, patronymic: String, surname: String)] = []

for i in array {
    let name = i
    let patr = name + "ович"
    let surname = name + "ов"
    var student = (name, patr, surname)
    studentsArray.append(student)
}

for student in studentsArray {
    switch student {
    case (let string, _, _) where string.characters.first == "А" ||  string.characters.first == "О" : print("Привет, \(string)!")
    case (let name, let string, _) where string.characters.first == "В" ||  string.characters.first == "Д" : print("Привет, \(name) \(string)!")
    case (_, _, let string) where string.characters.first == "Е" ||  string.characters.first == "З" : print("Привет, гражданин \(string)!")    
    default: print("Привет, товарищ \(student.name) \(student.patronymic) \(student.surname)!")
    }
}

print("\n***********************\n")

var ship1 = (x1: 2, x2: 2, y1: 3, y2: 5, pipe: 3)

var shipsArray = [ship1]

var hit = (x: 2, y:3)

for (i, ship) in shipsArray.enumerated() {
    print(ship)
    switch ship {
    case _ where (ship.x1 <= hit.x && ship.x2 >= hit.x) && (ship.y1 <= hit.y && ship.y2 >= hit.y) && ship.pipe > 0:
        print("ранил!")
        var updateShip = ship
        updateShip.pipe -= 1
        updateShip.pipe > 0 ? shipsArray[i] = updateShip : print("корабль уничтожен!")
    case _ where (ship.x1 <= hit.x && ship.x2 >= hit.x) && (ship.y1 <= hit.y && ship.y2 >= hit.y) && ship.pipe == 0: print("убил!")
    default: print("мимо!")
    }
}

print(shipsArray)


hit = (x: 2, y:4)

for (i, ship) in shipsArray.enumerated() {
    print(ship)
    switch ship {
    case _ where (ship.x1 <= hit.x && ship.x2 >= hit.x) && (ship.y1 <= hit.y && ship.y2 >= hit.y) && ship.pipe > 0:
        print("ранил!")
        var updateShip = ship
        updateShip.pipe -= 1
        updateShip.pipe > 0 ? shipsArray[i] = updateShip : print("корабль уничтожен!")
    case _ where (ship.x1 <= hit.x && ship.x2 >= hit.x) && (ship.y1 <= hit.y && ship.y2 >= hit.y) && ship.pipe == 0: print("убил!")
    default: print("мимо!")
    }
}

print(shipsArray)

hit = (x: 2, y:5)

for (i, ship) in shipsArray.enumerated() {
    print(ship)
    switch ship {
    case _ where (ship.x1 <= hit.x && ship.x2 >= hit.x) && (ship.y1 <= hit.y && ship.y2 >= hit.y) && ship.pipe > 0:
        print("ранил!")
        var updateShip = ship
        updateShip.pipe -= 1
        updateShip.pipe > 0 ? shipsArray[i] = updateShip : print("корабль уничтожен!")
    case _ where (ship.x1 <= hit.x && ship.x2 >= hit.x) && (ship.y1 <= hit.y && ship.y2 >= hit.y) && ship.pipe == 0: print("убил!")
    default: print("мимо!")
    }
}

print(shipsArray)

















