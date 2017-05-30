//
//  main.swift
//  Lesson_22_HW
//
//  Created by Stanly Shiyanovskiy on 30.05.17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

import Foundation

/*
 Рассмотрим такую ситуацию: есть семья - папа, мама и дети.
 Папа глава семьи, у него есть Мама, Мама контролирует детей, т.е. иерархия: Папа - Мама - Дети, Дети на одном уровне.
 Дети могут вызывать друг друга и они могут искать пути, как общаться с другими Детьми, например говорить "дай игрушку", спрашивать Маму: "Мама, дай конфетку", общаться с Папой: "Папа, купи игрушку".
 Вся эта иерархия лежит в объекте класса Семья, у которого есть методы, например распечатать всю Семью, т.е. метод вернёт массив всех членов Семьи.
 У Папы есть 3 кложера (closures) - 1. когда он обращается к Семье - распечатать всю Семью, 2. распечатать Маму, 3. распечатать всех Детей.
 Создать всю иерархию со связями. При выходе из зоны видимости все объекты должны быть уничтожены. Используем Command-Line Tool.
 */

class Human {
    var className : String
    var name : String
    init(className: String, name: String) {
        self.className = className
        self.name = name
    }
    
    deinit {
        print("\(className) was deinitialized")
    }
}

class Family {
    var father : Father
    var mother : Mother
    var child : [Child]
    
    init(father: Father, mother: Mother, child: Child...) {
        self.father = father
        self.mother = mother
        self.child = child
    }
    
    func printFamily() {
        let familyArray : [Human] = [father, mother] + child
        print("Family:")
        
        for i in familyArray {
            print("\(i.className) - \(i.name)")
        }
    }
}

class Father: Human {
    weak var family : Family!
    
    lazy var printFamily: () -> () = {
        [unowned self] in
        self.family.printFamily()
    }
    
    lazy var printWife: () -> () = {
        [unowned self] in
        print("\(self.className) wife is \(self.family.mother.name)")
    }
    
    lazy var printChilds: () -> () = {
        [unowned self] in
        print("\nThere are my kids:\n")
        for kid in self.family.child {
            print("\(kid.className) his name \(kid.name)")
        }
    }
}

class Mother: Human {
    weak var family : Family!
    
}

class Child: Human {
    weak var family : Family!
    
    lazy var heyBro: () -> () = {
        [unowned self] in
        print("Hey bro! I love you, \(self.family.child.last!.name)!")
    }
    
    lazy var giveCandy: () -> () = {
        [unowned self] in
        print("Hey mam! Give me a candy, mom \(self.family.mother.name)!")
    }
    
    lazy var buyAToy: () -> () = {
        [unowned self] in
        print("Hey dad! Buy me a toy please, dad \(self.family.father.name)!")
    }
}

if 5 > 2 {
    let father = Father(className: "Father", name: "A")
    let mother = Mother(className: "Mother", name: "B")
    let child1 = Child(className: "Child", name: "C1")
    let child2 = Child(className: "Child", name: "C2")
    let child3 = Child(className: "Child", name: "C3")
    var f = Family(father: father, mother: mother, child: child1, child2, child3)
    f.printFamily()
    
    father.family = f
    mother.family = f
    child1.family = f
    child2.family = f
    child3.family = f
    
    child2.heyBro()
    child1.giveCandy()
    child3.buyAToy()
    
    father.printWife()
    father.printFamily()
    father.printChilds()
}


