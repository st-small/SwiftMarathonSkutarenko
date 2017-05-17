import UIKit

/*
 1. создать массив "дни в месяцах"
 12 элементов содержащих количество дней в соответствующем месяце
 
 используя цикл for и этот массив
 
 - выведите количество дней в каждом месяце (без имен месяцев)
 - используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
 - сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)
 - сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется)
 
 - для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года
 
 2. Сделайте первое задание к уроку номер 4 используя массивы:
 
 (создайте массив опшинал интов и посчитайте сумму)
 
 - в одном случае используйте optional binding
 - в другом forced unwrapping
 - а в третьем оператор ??
 
 3. создайте строку алфавит и пустой массив строк
 
 в цикле пройдитесь по всем символам строки попорядку, преобразовывайте каждый в строку и добавляйте в массив, причем так, чтобы на выходе получился массив с алфавитом задом-наперед
 */

let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let monthTitle = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

for month in daysInMonth {
    print(month)
}

print("\n******************\n")

for i in 0..<daysInMonth.count {
    print("In \(monthTitle[i]) month - \(daysInMonth[i]) days")
}

print("\n******************\n")

let months = [("Jan", 31), ("Feb", 28), ("Mar", 31), ("Apr", 30), ("May", 31), ("Jun", 30), ("Jul", 31), ("Aug", 31), ("Sep", 30), ("Oct", 31), ("Nov", 30), ("Dec", 31)]

for month in months {
    print("In \(month.0) month - \(month.1) days")
}

print("\n******************\n")

for month in months.reversed() {
    print("In \(month.0) month - \(month.1) days")
}

print("\n******************\n")

let dayBirth = 1
let monthBirth = "Aug"
var sumOfDays = 0

for month in months {
    
    if month.0 != monthBirth {
        sumOfDays += month.1
    } else {
        sumOfDays += dayBirth - 1
        print("The sum of days from Jan 1st to birthday is \(sumOfDays)")
    }
}

print("\n******************\n")

let a = "abc"
let b = "123"
let c = "def"
let d = "456"
let e = "ghi"
var sum = 0

var array = [a, b, c, d, e]

// optional binding
for i in array {
    if let int = Int(i) {
        sum += int
    }
}
print(sum)

// force unwrapping
sum = 0
for i in array {
    if Int(i) != nil {
        sum += Int(i)!
    }
}
print(sum)

// ??
sum = 0
for i in array {
    sum += Int(i) ?? 0
}
print(sum)

print("\n******************\n")

var alphabet = "abcdefghijklmnopqrstuvwxyz"
var stringsArray : [String] = []

for char in alphabet.characters.reversed() {
    stringsArray.append(String(char))
}

print(stringsArray)














