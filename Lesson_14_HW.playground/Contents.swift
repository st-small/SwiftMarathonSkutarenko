import UIKit

/*
 1. Самостоятельно повторить проделанное в уроке
 
 2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0)
 
 3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями)
 
 4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B
 */

struct Student {
    
    struct dateBirth {
        var day : Int
        var month : Int
        var year : Int
        
    }
    
    var firstName : String {
        didSet {
            firstName = firstName.capitalized
        }
    }
    var lastName : String {
        didSet {
            lastName = lastName.capitalized
        }
    }
    var dateOfBirth : dateBirth
    
    var fullName : String {
        return firstName + " " + lastName
    }
    
    var age : Int {
        let currentYear = Calendar.current.component(.year, from: Date())
        return currentYear - dateOfBirth.year
    }
    
    var studyExperience : Int {
        
        if self.age < 6 {
            return 0
        }
        
        return self.age - 6
    }
}

var student = Student(firstName: "Stas", lastName: "Shiaynovskiy", dateOfBirth: .init(day: 26, month: 1, year: 1985))

print(Date())

student.firstName
student.lastName
student.fullName
student.age
student.studyExperience

print("\n***************************\n")

struct Segment {
    
    struct Point {
        var x : Float
        var y : Float
    }
    
    var pointA : Point
    var pointB : Point
    
    var middlePoint : Point {
        get {
            let middlePointX = (pointB.x - pointA.x)/2
            let middlePointY = (pointB.y - pointA.y)/2
            
            return Point(x: middlePointX, y: middlePointY)
        }
        set {
            let deltaX = (newValue.x - middlePoint.x)
            let deltaY = (newValue.y - middlePoint.y)
            
            pointA.x += deltaX
            pointA.y += deltaY
            
            pointB.x += deltaX
            pointB.y += deltaY
        }
    }
    
    var lengthOfSegment : Float {
        get {
            return sqrt(pow((pointB.x - pointA.x), 2) + pow((pointB.y - pointA.y), 2))
        }
        set {
            pointB.x = pointA.x + newValue * (pointB.x - pointA.x) / lengthOfSegment
            pointB.y = pointA.y + newValue * (pointB.y - pointA.y) / lengthOfSegment
            
        }
    }
}

var segment = Segment(pointA: Segment.Point(x: 100, y: 100), pointB: Segment.Point(x: 530, y: 530))
segment.middlePoint
segment.lengthOfSegment

segment.lengthOfSegment = 250
segment.middlePoint



