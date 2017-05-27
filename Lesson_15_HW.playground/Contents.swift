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
    
    static func UIColor(hex: Int) -> UIColor {
        let rgb = OceanColor.hexToRgb(hex: hex)
        print(rgb)
        return UIColor(red:rgb.r, green:rgb.g, blue:rgb.b, alpha:1.0)
    }
}

//class Human {
//    var name : String
//    var lastName : String
//    var age : Int
//    var height : Double
//    var weight : Double
//}

let rgb = OceanColor.hexToRgb(hex: 100)
let color = UIColor(red: rgb.r, green: rgb.g, blue: rgb.b, alpha: 1.0)

var label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
label.backgroundColor = color

print(label)


