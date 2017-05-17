import UIKit

/*
 1. Создать пять строковых констант
 
 Одни константы это только цифры, другие содержат еще и буквы
 
 Найти сумму всех этих констант приведя их к Int
 
 (Используйте и optional binding и forced unwrapping)
 
 2. С сервера к нам приходит тюпл с тремя параметрами:
 
 statusCode, message, errorMessage (число, строка и строка)
 
 в этом тюпле statusCode всегда содержит данные, но сама строка приходит только в одном поле
 
 если statusCode от 200 до 300 исключительно, то выводите message,
 
 в противном случает выводите errorMessage
 
 После этого проделайте тоже самое только без участия statusCode
 
 3. Создайте 5 тюплов с тремя параметрами:
 
 имя, номер машины, оценка за контрольную
 
 при создании этих тюплов не должно быть никаких данных
 
 после создания каждому студенту установите имя
 
 некоторым установите номер машины
 
 некоторым установите результат контрольной
 
 выведите в консоль:
 
 - имена студента
 - есть ли у него машина
 - если да, то какой номер
 - был ли на контрольной
 - если да, то какая оценка
 */

let a = "abc"
let b = "123"
let c = "def"
let d = "456"
let e = "ghi"
var sum = 0

var array = [a, b, c, d, e]

for i in array {
    if let int = Int(i) {
        sum += int
    }
}

print("Сумма всех строковых значений равна \(sum)\n")

var serverTuple : (statusCode: Int, message: String?, errorMessage: String?)

serverTuple.statusCode = Int(arc4random_uniform(600) + 200)
serverTuple.errorMessage = "Oh No!!!"
serverTuple.message = "All fine!"

if serverTuple.statusCode >= 200 && serverTuple.statusCode < 300 {
    print("Message is \(serverTuple.message!)")
} else {
    print("Error message is \(serverTuple.errorMessage!)")
}

var student1, student2, student3, student4, student5 : (name: String?, car: String?, score: Float?)

student1.name = "Boris"
student2.name = "Leonid"
student3.name = "Andy"
student4.name = "Roman"
student5.name = "Sema"

student1.car = "BA1212"
student3.car = "AA1234"
student5.car = "CA5678"

student2.score = Float(arc4random_uniform(501)) / 100
student4.score = Float(arc4random_uniform(501)) / 100

var studentsArray = [student1, student2, student3, student4, student5]

print("\nStudents list:")
for student in studentsArray {
    
    if let car = student.car {
        print("\nStudent \(student.name!) has a car with license plate \(student.car!)")
    } else if let score = student.score {
        print("\nStudent \(student.name!) passed exam with score \(student.score!)")
    }
    
}



