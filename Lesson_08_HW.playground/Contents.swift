import UIKit

/*
 1. Создайте дикшинари как журнал студентов, где имя и фамилия студента это ключ, а оценка за контрольную значение. Некоторым студентам повысьте оценки - они пересдали. Потом добавьте парочку студентов, так как их только что перевели к вам в группу. А потом несколько удалите, так как они от вас ушли :(
 
 После всех этих перетрубаций посчитайте общий бал группы и средний бал
 
 2. Создать дикшинари дни в месяцах, где месяц это ключ, а количество дней - значение.
 В цикле выведите ключ-значение попарно, причем один раз выведите через тюплы, а другой раз пройдитесь по массиву ключей и для каждого из них доставайте значения.
 
 3. Создать дикшинари , в которой ключ это адрес шахматной клетки (пример: a5, b3, g8), а значение это Bool. Если у клетки белый цвет, то значение true, а если черный - false. Выведите дикшинари в печать и убедитесь что все правильно.
 
 Рекомендация: постарайтесь все сделать используя вложенный цикл (объяснение в уроке).
 */

var students = ["Ivan Ivanov" : 5.0, "Petr Petrov" : 3.5, "Sidor Sidorov" : 2.5, "Nick Nikolaev" : 1.3, "Semen Semenov" : 4.7]

for (key, value) in students {
    if value < 3 {
        print("Student \(key) has bad score (\(value)) and his new score should be:")
        let score = Double((arc4random_uniform(101) + 400) / 100)
        students[key] = score
        print(score)
    }
}

print(students)

students.updateValue(3.6, forKey: "Alex Alekseev")
students.updateValue(4.8, forKey: "Roman Romanov")

print("There are new students in goup. Full list now: \(students)")

students.removeValue(forKey: "Semen Semenov")
students.removeValue(forKey: "Petr Petrov")

var totalScore = 0.0
for key in students.keys {
    totalScore += students[key]!
}

print("\nThe total score of student's group is \(totalScore)")
print("\nThe average score of student's group is \(totalScore/Double(students.count))")

print("\n*****************************\n")

let months = ["Jan" : 31, "Feb" : 28, "Mar" : 31, "Apr" : 30, "May" : 31, "Jun" : 30, "Jul" : 31, "Aug" : 31, "Sep" : 30, "Oct" : 31, "Nov" : 30, "Dec" : 31]

// tuples
print("using tuples:\n")
for (key, value) in months {
    print("\(key) month has \(value) days")
}

// key value
print("\nusing key value:\n")
for key in months.keys {
    print("\(key) month has \(months[key]!) days")
}

print("\n*****************************\n")

let arrayNumbers = [1, 2, 3, 4, 5, 6, 7, 8]
let arrayLiterals = ["a", "b", "c", "d", "e", "f", "g", "h"]
var squaresChessBoard = [String : Bool]()

for (indexI, i) in arrayNumbers.enumerated() {
    for (indexJ, j) in arrayLiterals.enumerated() {
        if indexI % 2 == indexJ % 2 {
            squaresChessBoard.updateValue(false, forKey: "\(i)\(j) - ")
        } else {
            squaresChessBoard.updateValue(true, forKey: "\(i)\(j) - ")
        }
    }
}

print(squaresChessBoard)









