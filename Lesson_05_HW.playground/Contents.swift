import UIKit

// 26.01
/*
 1. Посчитать количество секунд от начала года до вашего дня рождения. Игнорируйте високосный год и переходы на летнее и зимнее время. Но если хотите - не игнорируйте :)
 
 2. Посчитайте в каком квартале вы родились
 
 3. Создайте пять переменных типа Инт и добавьте их в выражения со сложением, вычитанием, умножением и делением. В этих выражениях каждая из переменных должна иметь при себе унарный постфиксный или префиксный оператор. Переменные могут повторяться.
 
 Убедитесь что ваши вычисления в голове или на бумаге совпадают с ответом. Обратите внимание на приоритет операций
 
 4. Шахматная доска 8х8. Каждое значение в диапазоне 1…8. При заданных двух значениях по вертикали и горизонтали определите цвет поля. Если хотите усложнить задачу, то вместо цифр на горизонтальной оси используйте буквы a,b,c,d,e,f,g,h
 */

let oneMminute = 60
let oneHour = 60 * oneMminute
let oneDay = oneHour * 24

let daysFromYearBeginningToMyBirth = 26
let secondsFromYearBeginningToMyBirth = 26 * oneDay

print("There are \(secondsFromYearBeginningToMyBirth) seconds from 01.01.17 to my birthday")

print("\n***********************************************\n")

let daysInFirstQuarter = 31 + 28 + 31
let daysInSecondQuarter = 30 + 31 + 30
let daysInThirdQuarter = 31 + 31 + 30

print("\n****************** Variant 1 ******************\n")

if daysFromYearBeginningToMyBirth > (daysInFirstQuarter + daysInSecondQuarter + daysInThirdQuarter) {
    
    print("I was born in Firth Quarter")
    
} else if daysFromYearBeginningToMyBirth > (daysInFirstQuarter + daysInSecondQuarter) && daysFromYearBeginningToMyBirth < (daysInFirstQuarter + daysInSecondQuarter + daysInThirdQuarter) {
    
    print("I was born in Third Quarter")
    
} else if daysFromYearBeginningToMyBirth > daysInFirstQuarter && daysFromYearBeginningToMyBirth < (daysInFirstQuarter + daysInSecondQuarter) {
    
    print("I was born in Second Quarter")
    
} else {
    
    print("I was born in First Quarter")
}

print("\n****************** Variant 2 ******************\n")

if daysFromYearBeginningToMyBirth > daysInFirstQuarter {
    if daysFromYearBeginningToMyBirth > (daysInFirstQuarter + daysInSecondQuarter) {
        if daysFromYearBeginningToMyBirth > (daysInFirstQuarter + daysInSecondQuarter + daysInThirdQuarter) {
            
            print("I was born in Firth Quarter")
            
        } else {
            
            print("I was born in Third Quarter")
        }
        
    } else {
        
        print("I was born in Second Quarter")
    }
} else {
    
    print("I was born in First Quarter")
}

print("\n***********************************************\n")

//var a = 5
//var b = 3
//var c = 7
//var d = 8
//var e = 12
//
//let i = ++a + b-- + c++ - --d + e++

var array = ["a", "b", "c", "d", "e", "f", "g", "h"]

for i in 1...8 {
    for j in 0..<array.count {
        //print(i, j+1, array[j])
        if (i % 2 == 1 && j % 2 == 1) || (i % 2 == 0 && j % 2 == 0){
            print("\(i), \(array[j]) - клетка белая")
        } else {
            print("\(i), \(array[j]) - клетка черная")
        }
    }
}



