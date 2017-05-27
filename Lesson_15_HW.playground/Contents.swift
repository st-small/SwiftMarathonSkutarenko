import UIKit

/*
 1. Создать структуру “Описание файла” содержащую свойства:
 - путь к файлу
 - имя файла
 - максимальный размер файла на диске
 - путь к папке, содержащей этот файл
 - тип файла (скрытый или нет)
 - содержимое файла (можно просто симулировать контент)
 
 Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.
 
 2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.
 
 3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
 - минимальный и максимальный возраст каждого объекта
 - минимальную и максимальную длину имени и фамилии
 - минимально возможный рост и вес
 - самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
 */

let Title = "12345"

struct FileDescription {
    static let fileMaxSize : Double = 777.0
    var filePath : String
    var fileName : String
    var fileSize : Double {
        didSet {
           self.fileSize = fileSize > FileDescription.fileMaxSize ? FileDescription.fileMaxSize : fileSize
        }
    }
    var filePathFolder : String {
        return filePath + "/" + fileName
    }
    var fileIsHidden : Bool
    var filePreview : String {
        get {
            if fileIsHidden == true {
                return "No access!"
            } else {
                return "some text in file here..."
            }
        }
    }
    
    init(name: String, path: String, size: Double, isHidden: Bool) {
        self.fileName = name
        self.filePath = path
        self.fileIsHidden = isHidden
        self.fileSize = size > FileDescription.fileMaxSize ? FileDescription.fileMaxSize : size
    }
}

var file1 = FileDescription(name: "/Temp/Stas/MyFiles", path: "Report", size: 115, isHidden: false)
print(file1.filePathFolder)
print(file1.filePreview)
print("\(file1.fileSize) mb")
print("\n************\n")

var file2 = FileDescription(name: "Private/Stas", path: "Passwords", size: 300, isHidden: true)
//file2.fileSize = 300
print(file2.filePathFolder)
print(file2.filePreview)
print("\(file2.fileSize) mb")

print("\n************\n")

var file3 = FileDescription(name: "/Desktop/Garbage", path: "Something", size: 1000, isHidden: false)
print(file3.filePathFolder)
print(file3.filePreview)
print("\(file3.fileSize) mb")
file3.fileSize = 1200
print("\(file3.fileSize) mb")

enum OceanColor: Int {
    
    static let count = 6
    static let startColor = OceanColor.Sky1
    static let endColor = OceanColor.Sky1
    
    case Sky1 = 0x264890
    case Sky2 = 0x3884CF
    case Ocean1 = 0xFD4CB
    case Ocean2 = 0x67D29E
    case Beach1 = 0xB7C0A5
    case Beach2 = 0xDFD2C1
    
    static func hexToRgb(hex: Int) -> (r:CGFloat, g:CGFloat, b:CGFloat) {
        return (r:CGFloat((hex >> 16) & 0xFF) / 255, g:CGFloat((hex >> 08) & 0xFF) / 255, b:CGFloat(hex & 0xFF) / 255)
    }
    
    static func Color(hex: Int) -> UIColor {
        let rgb = OceanColor.hexToRgb(hex: hex)
        return UIColor(red:rgb.r, green:rgb.g, blue:rgb.b, alpha:1.0)
    }
}

class Human {
    
    static var totalHumans = 0
    
    static let minNameLength = 2
    static let maxNameLength = 15
    
    static let minAge = 0
    static let maxAge = 100
    
    static let minHeight = 0.5
    static let minWeight = 3.0
    
    var name : String
    var lastName : String
    var age : Int?
    var height : Double?
    var weight : Double?
    
    init(name: String, lastName: String, age: Int, height: Double, weight: Double) {
        self.name = (name.characters.count > Human.minNameLength && name.characters.count < Human.maxNameLength) ? name : "No Name"

        self.lastName = (lastName.characters.count > Human.minNameLength && lastName.characters.count < Human.maxNameLength) ? lastName : "No Last Name"
        
        self.age = (age > Human.minAge && age < Human.maxAge) ? age : nil
        
        self.height = height > Human.minHeight ? height : nil
        
        self.weight = weight > Human.minWeight ? weight : nil
        
        Human.totalHumans += 1
    }
}

func printHuman(human: Human) {
    var age = 0
    let height = human.height ?? 0
    let weight = human.weight ?? 0
    if human.age != nil {
        age = human.age!
    }
    
    print("Human with name \(human.name) & lastName \(human.lastName) has \(age) years old. The height is \(height) meters & weight is \(weight) kgs")
}

func printHumansCount() {
    switch Human.totalHumans {
    case 1: print("There are 1 human in stack")
    default: print("There are \(Human.totalHumans) humans in stack")
    }
}

let man1 = Human(name: "1", lastName: "Coys", age: 25, height: 1.67, weight: 87.5)
printHuman(human: man1)
printHumansCount()

let man2 = Human(name: "dfjshfskjhfkjhdfkjdsfjhkds", lastName: "ds", age: 123445, height: 3546, weight: 14)
printHuman(human: man2)
printHumansCount()
