import UIKit

/*
 1. У нас есть базовый клас "Артист" и у него есть имя и фамилия. И есть метод "Выступление". У каждого артиста должно быть свое выступление: танцор танцует, певец поет и тд. А для художника, что бы вы не пытались ставить, пусть он ставит что-то свое (пусть меняет имя на свое артистическое). Когда вызываем метод "выступление" показать в консоле имя и фамилию артиста и собственно само выступление.
 Полиморфизм используем для артистов. Положить их всех в массив, пройтись по нему и вызвать их метод "выступление"
 
 2. Создать базовый клас "транспортное средство" и добавить три разных проперти: скорость, вместимость и стоимость одной перевозки (computed). Создайте несколько дочерних класов и переопределите их компютед проперти у всех. Создайте класс самолет, корабль, вертолет, машина и у каждого по одному объекту. В компютед пропертис каждого класса напишите свои значения скорости, вместимости, стоимости перевозки. + у вас должен быть свой метод который считает сколько уйдет денег и времени что бы перевести из пункта А в пункт В определенное количество людей с использованимем наших транспортных средств. Вывести в кольсоль результат (как быстро сможем перевести, стоимость, количество перевозок).
 Используем полиморфизм
 
 3. Есть 5 классов: люди, крокодилы, обезьяны, собаки, жирафы. (в этом задании вы будете создавать не дочерние классы, а родительские и ваша задача создать родительский таким образом, что бы группировать эти 5).
 - Создайте по пару объектов каждого класса.
 - Посчитайте присмыкающихся (создайте масив, поместите туда присмыкающихся и скажите сколько в нем объектов)
 - Сколько четвероногих?
 - Сколько здесь животных?
 - Сколько живых существ?

 */

class Artist {
    
    var firstName : String = ""
    var lastName : String = ""
    
    func appearance() -> String {
        return "\(firstName) \(lastName)"
    }
}

class Dancer : Artist {
    
    override func appearance() -> String {
        return super.appearance() + " dances well"
    }
}

class Singer : Artist {
    
    override func appearance() -> String {
        return super.appearance() + " sings only the hits of 90th"
    }
}

class Painter : Artist {
    
    override var firstName: String {
        didSet {
            super.firstName = "Loshadka***"
        }
    }
    
    override func appearance() -> String {
        return super.appearance() + " sketches the picture"
    }
}

let dancer = Dancer()
dancer.firstName = "Lily"
dancer.lastName = "Bellona"

let singer = Singer()
singer.firstName = "Leo"
singer.lastName = "Golos"

let painter = Painter()
painter.firstName = "Gleb"
painter.lastName = "Somatov"

let artistArray = [dancer, singer, painter]

for artist in artistArray {
    print(artist.appearance())
}

print("\n**********************************\n")

class Transport {
    var name : String {
        return ""
    }
    var speed : Double = 0
    var capacity : Int = 0
    var price : Double {
        return speed
    }
    init(speed: Double, capacity: Int) {
        self.speed = speed
        self.capacity = capacity
    }
    
    func price(distance: Int, passengers: Int) {
        let a = passengers/capacity
        print("Distance: \(distance), Passengers: \(passengers)")
        print("Time delivery ~ : \(Int(Double(distance)/speed) * a) hours\nPrice: \(price * Double(a)) $\nDelivery counts: \(a)")
        print("\n**********************************\n")
    }
}

class Plane : Transport {
    override var name: String {
        return "Plane"
    }
    
    override var price: Double {
        return super.price * 5
    }
}

class Helicopter : Transport {
    override var name: String {
        return "Helicopter"
    }
    
    override var price: Double {
        return super.price * 4
    }
}

class Ship : Transport {
    override var name: String {
        return "Ship"
    }
    
    override var price: Double {
        return super.price * 3
    }
}

class Car : Transport {
    override var name: String {
        return "Car"
    }
    
    override var price: Double {
        return super.price * 2
    }
}

var plane = Plane(speed: 300, capacity: 200)
var heli = Helicopter(speed: 150, capacity: 20)
var ship = Ship(speed: 100, capacity: 100)
var car = Car(speed: 100, capacity: 4)

var transportArr : [Transport] = [plane, heli, ship, car]

for kind in transportArr {
    print(kind.name)
    kind.price(distance: 1000, passengers: 350)
}

class Object {
    var objectType : String {
        return ""
    }
    var isHuman : Bool
    var isLivingBeing : Bool
    var countLegs : Int
    
    init(countLegs: Int, isHuman: Bool, isLivingBeing: Bool) {
        self.countLegs = countLegs
        self.isHuman = isHuman
        self.isLivingBeing = isLivingBeing
    }
    
}

class Human : Object {
    override var objectType: String {
        return "Human"
    }
}

class Croco : Object {
    override var objectType: String {
        return "Croco"
    }
}

class Giraffe : Object {
    override var objectType: String {
        return "Giraffe"
    }
}

class Dog : Object {
    override var objectType: String {
        return "Dog"
    }
}

class Monkey : Object {
    override var objectType: String {
        return "Monkey"
    }
}

let croco = Croco(countLegs: 4, isHuman: false, isLivingBeing: true)
let croco2 = Croco(countLegs: 4, isHuman: false, isLivingBeing: true)
let gira = Giraffe(countLegs: 4, isHuman: false, isLivingBeing: true)
let gira2 = Giraffe(countLegs: 4, isHuman: false, isLivingBeing: true)
let dog = Dog(countLegs: 4, isHuman: false, isLivingBeing:  true)
let dog2 = Dog(countLegs: 4, isHuman: false, isLivingBeing:  true)
let mon = Monkey(countLegs: 2, isHuman: false, isLivingBeing: true)
let mon2 = Monkey(countLegs: 2, isHuman: false, isLivingBeing: true)
let human = Human(countLegs: 2, isHuman: true, isLivingBeing: true)
let human2 = Human(countLegs: 2, isHuman: true, isLivingBeing: true)

let array : [Object] = [croco, croco2, gira, gira2, dog, dog2, mon, mon2, human, human2]
var reptileArray = [Object]()
var fourLegsArray = [Object]()
var animals = [Object]()
var livingBeing = [Object]()

for obj in array {
    
    if obj.objectType == "Croco" {
        
        reptileArray.append(obj)
        
    }
    
    if obj.countLegs == 4 {
        
        fourLegsArray.append(obj)
        
    }
    
    if obj.isHuman == false {
        
        animals.append(obj)
        
    }
    
    if obj.isLivingBeing == true {
        
        livingBeing.append(obj)
    }

}

print("There are objects:\nReptiles are: \(reptileArray.count)\nFour legs are: \(fourLegsArray.count)\nAnimals are: \(animals.count)\nLiving being are: \(livingBeing.count)")
