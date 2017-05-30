import UIKit

/*
 Сегодня будем строить свою небольшую социальную сеть.
 1. Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (всё опционально).
 Сделать примерно 30 человек, взять одного из них, поставить ему Папу/Маму. Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.
 Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд
 2. Все сестры, матери,... должны быть класса Женщина, Папы, братья,... класса Мужчины.
 У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее.
 Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.
 3. Расширить класс человек, у него будет проперти Домашние_животные. Животные могут быть разные (попугаи, кошки, собаки...) их может быть несколько, может и не быть вообще.
 Раздать некоторым людям домашних животных. Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть - добавлять всех животных в массив животных. Посчитать сколько каких животных в этом массиве.
 Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
 Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.
 
 Обязательно используем в заданиях Optional chaining и Type casting
 */

var family: [AnyObject] = []

class Human {
    var name: String
    
    var father: Man?
    var mother: Woman?
    var brother: Man?
    var sister: Woman?
    var son: Man?
    var daughter: Woman?
    var cousinBrother: Man?
    var cousinSister: Woman?
    
    var pet: [Pet]?
    
    init(name: String) {
        self.name = name
    }
}

class Man: Human {
    static var mansNames = ["Иван","Петр","Степан","Олег","Роман","Ян","Леонид","Федор","Семен","Роберт","Жорж","Сидор","Гавриил","Богдан"]
    init() {
        super.init(name: Man.mansNames[Int(arc4random_uniform(14))])
        family.append(self)
    }
    
    // двигать диван
    static func moveTheSofa(man: Man) {
        print("\(man.name) is moving the sofa!")
    }
}

class Woman: Human {
    static var womansNames = ["Анна","Елена","Ольга","Татьяна","Марина","Светлана","Жанна","Яна","Алла","Екатерина","Алина","Елизавета","Надежда","Тамара"]
    init() {
        super.init(name: Woman.womansNames[Int(arc4random_uniform(14))])
        family.append(self)
    }
    
    // приказать двигать диван
    static func command(woman: Woman) {
        print("\(woman.name) Commands to do something!!!")
    }
}

class Pet {
    static var petNames = ["Doggy", "Kitty", "Monkey", "Parrot", "Dori"]
    var nickname: String
    init() {
        nickname = Pet.petNames[Int(arc4random_uniform(5))]
    }
}

var humans: [Human] = []


for i in 1...30 {
    let new = i % 2 == 0 ? Man() : Woman()
    humans.append(new)
}

let person = humans[Int(arc4random_uniform(30))]
person.father = Man()
person.father?.father = Man()
person.father?.mother = Woman()
person.father?.brother = Man()
person.father?.cousinBrother = Man()
person.father?.brother?.son = Man()
person.father?.cousinBrother?.son = Man()
person.father?.brother?.daughter = Woman()
person.father?.cousinBrother?.daughter = Woman()
person.father?.sister = Woman()
person.father?.cousinSister = Woman()
person.father?.sister?.son = Man()
person.father?.cousinSister?.son = Man()
person.father?.sister?.daughter = Woman()
person.father?.cousinSister?.daughter = Woman()

person.mother = Woman()
person.mother?.father = Man()
person.mother?.mother = Woman()
person.mother?.brother = Man()
person.mother?.cousinBrother = Man()
person.mother?.brother?.son = Man()
person.mother?.cousinBrother?.son = Man()
person.mother?.brother?.daughter = Woman()
person.mother?.cousinBrother?.daughter = Woman()
person.mother?.sister = Woman()
person.mother?.cousinSister = Woman()
person.mother?.sister?.son = Man()
person.mother?.cousinSister?.son = Man()
person.mother?.sister?.daughter = Woman()
person.mother?.cousinSister?.daughter = Woman()

person.sister = Woman()
person.brother = Man()

var uncles = 0
var aunts = 0
var cousinBrothers = 0
var secondCousinSisters = 0

// check from father line
if ((person.father?.brother) != nil) {
    uncles += 1
    if ((person.father?.brother?.son) != nil) {
        cousinBrothers += 1
    }
}
if ((person.father?.cousinBrother) != nil) {
    uncles += 1
    if ((person.father?.cousinBrother?.daughter) != nil) {
        secondCousinSisters += 1
    }
}
if ((person.father?.sister) != nil) {
    aunts += 1
    if ((person.father?.sister?.son) != nil) {
        cousinBrothers += 1
    }
}
if ((person.father?.cousinSister) != nil) {
    aunts += 1
    if ((person.father?.cousinSister?.daughter) != nil) {
        secondCousinSisters += 1
    }
}

// check from mother line
if ((person.mother?.brother) != nil) {
    uncles += 1
    if ((person.mother?.brother?.son) != nil) {
        cousinBrothers += 1
    }
}
if ((person.mother?.cousinBrother) != nil) {
    uncles += 1
    if ((person.mother?.cousinBrother?.daughter) != nil) {
        secondCousinSisters += 1
    }
}
if ((person.mother?.sister) != nil) {
    aunts += 1
    if ((person.mother?.sister?.son) != nil) {
        cousinBrothers += 1
    }
}
if ((person.mother?.cousinSister) != nil) {
    aunts += 1
    if ((person.mother?.cousinSister?.daughter) != nil) {
        secondCousinSisters += 1
    }
}

print("The person names \(person.name) has:\nFather names \(person.father?.name ?? "No name") & Mother names \(person.mother?.name ?? "No Name")\nAlso has Brother names \(person.brother?.name ?? "No Name") & Sister names \(person.sister?.name ?? "No Name")\nThere are \(uncles) uncles and \(aunts) ants\nAlso has \(cousinBrothers) cousin brothers and \(secondCousinSisters) second cousin sisters")

var mans = 0
var womans = 0

for i in family {
    if i is Man {
        mans += 1
        Man.moveTheSofa(man: i as! Man)
    } else if i is Woman {
        womans += 1
        Woman.command(woman: i as! Woman)
    }
}

print("\nThere are \(mans) mans & \(womans) womans in the family")

for (i, value) in humans.enumerated() {
    if i % 2 == 0 {
        value.pet?.append(Pet())
        value.pet?.append(Pet())
    } else if i % 3 == 0 {
        value.pet?.append(Pet())
        value.pet?.append(Pet())
        value.pet?.append(Pet())
    }
}

for value in humans {
    print(<#T##items: Any...##Any#>)
}


