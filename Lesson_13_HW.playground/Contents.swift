import UIKit

/*
 1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
 
 2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
 
 3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
 
 4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
 
 5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
 
 6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?
 
 007. Уровень супермен
 
 Выполните задание шахмат из урока по энумам используя структуры либо классы
 */

//var dictUsers = ["ivan" : ["12:00": 123, "15:00": 24, "16:00" :27], "stepan" : ["10:00": 12, "11:00":14, "12:00":17]]
//
//for i in dictUsers {
//    print(i)
//    if i.key == "ivan" {
//        print(i.value)
//        dictUsers[i.key]?.updateValue(100, forKey: "77:77")
//        
//    }
//}
//
//print(dictUsers["ivan"] ?? 0)

//class ViewModel {
//    
//    let name : String?
//    var freeTime : [String : Int]?
//    
//    init(name: String, freeTime: [String : Int]) {
//        self.freeTime = freeTime
//        self.name = name
//    }
//}
//
//var data = [ViewModel]()
//
//data.append(ViewModel(name: "igor", freeTime: ["12:00" : 1]))
//
//let nameKirill = "kirill"
//let time = "12:05"
//let rate = 2
//
//data.append(ViewModel(name: nameKirill, freeTime: [time : rate]))
//
//for i in data {
//    if i.name == "kirill" {
//        print(i.freeTime ?? 0)
//        i.freeTime?.updateValue(3, forKey: "11:55")
//    }
//}
//
//data[1].freeTime
print("\n******************** Working with Student Struct ********************\n")
struct Student {
    var name : String
    var lastName : String
    var age : Int
    var score : Double
    
}

var st1 = Student(name: "Ivan", lastName: "Ivanov", age: 20, score: 2.5)
var st2 = Student(name: "Petr", lastName: "Petrov", age: 21, score: 3.7)
var st3 = Student(name: "Sidor", lastName: "Sidorov", age: 19, score: 4.9)
var st4 = Student(name: "Anton", lastName: "Ivanov", age: 20, score: 2.6)
var st5 = Student(name: "Bogdan", lastName: "Petrov", age: 21, score: 3.8)
var st6 = Student(name: "Nick", lastName: "Sidorov", age: 19, score: 4.7)

var studentsArr = [st1, st2, st3, st4, st5, st6]

func printStudentsList(students: [Student]) {
    for (i, student) in students.enumerated() {
        print("\(i+1) - \(student.name) \(student.lastName) \(student.age) \(student.score)")
    }
}

printStudentsList(students: studentsArr)

print("\n********************\n")
print("Sorted by score:\n")
studentsArr = studentsArr.sorted {$0.score > $1.score}
printStudentsList(students: studentsArr)

print("\n********************\n")
print("Sorted by lastname & name:\n")
studentsArr = studentsArr.sorted(by: { (first: Student, second: Student) -> Bool in
    if first.lastName == second.lastName {
        return first.name < second.name
    } else {
        return first.lastName < second.lastName
    }
})
printStudentsList(students: studentsArr)

print("\n********************\n")
var anotherStudentsArr = studentsArr
for i in 0..<anotherStudentsArr.count {
    let name = anotherStudentsArr[i].name
    anotherStudentsArr[i].name += " \(name)ich"
}

printStudentsList(students: anotherStudentsArr)
print("**********")
printStudentsList(students: studentsArr)

print("\n******************** Working with Student Class ********************\n")
class StudentClass {
    var name : String
    var lastName : String
    var age : Int
    var score : Double
    
    init(name: String, lastName: String, age: Int, score: Double) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.score = score
    }
}

var stC1 = StudentClass(name: "Ivan", lastName: "Ivanov", age: 20, score: 2.5)
var stC2 = StudentClass(name: "Petr", lastName: "Petrov", age: 21, score: 3.7)
var stC3 = StudentClass(name: "Sidor", lastName: "Sidorov", age: 19, score: 4.9)
var stC4 = StudentClass(name: "Anton", lastName: "Ivanov", age: 20, score: 2.6)
var stC5 = StudentClass(name: "Bogdan", lastName: "Petrov", age: 21, score: 3.8)
var stC6 = StudentClass(name: "Nick", lastName: "Sidorov", age: 19, score: 4.7)

var studentsClassArr = [stC1, stC2, stC3, stC4, stC5, stC6]

func printStudentsClassList(students: [StudentClass]) {
    for (i, student) in students.enumerated() {
        print("\(i+1) - \(student.name) \(student.lastName) \(student.age) \(student.score)")
    }
}

printStudentsClassList(students: studentsClassArr)

print("\n********************\n")
print("Sorted by score:\n")
studentsClassArr = studentsClassArr.sorted {$0.score > $1.score}
printStudentsClassList(students: studentsClassArr)
print("\n********************\n")

print("Sorted by lastname & name:\n")
studentsClassArr = studentsClassArr.sorted(by: { (first: StudentClass, second: StudentClass) -> Bool in
    if first.lastName == second.lastName {
        return first.name < second.name
    } else {
        return first.lastName < second.lastName
    }
})
printStudentsClassList(students: studentsClassArr)

print("\n********************\n")
var anotherStudentsClassArr = studentsClassArr
for student in anotherStudentsClassArr {
    student.name += " \(student.name)ich"
}

printStudentsClassList(students: anotherStudentsClassArr)
print("**********")
printStudentsClassList(students: studentsClassArr)








