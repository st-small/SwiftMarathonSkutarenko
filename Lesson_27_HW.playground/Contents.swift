import UIKit

/*
 1. Объявить протокол Food, который будет иметь проперти name (только чтение) и метод taste(), который будет выводить текст со вкусовыми ощущениями
 
 2. Все продукты разных типов, которые вы принесли из супермаркета, находятся в сумке (массив) и все, как ни странно, реализуют протокол Food. Вам нужно пройтись по сумке, назвать предмет и откусить кусочек. Можете отсортировать продукты до имени. Используйте для этого отдельную функцию, которая принимает массив продуктов
 
 3. Некоторые продукты могут испортиться, если их не положить в холодильник. Создайте новый протокол Storable, он наследуется от протокола Food и содержит еще булевую проперти - expired. У некоторых продуктов замените Food на Storable. Теперь пройдитесь по всем продуктам и, если продукт надо хранить в холодильнике, то перенесите его туда, но только если продукт не испорчен уже, иначе просто избавьтесь от него. Используйте функцию для вывода продуктов для вывода содержимого холодильника
 
 4. Добавьте проперти daysToExpire в протокол Storable. Отсортируйте массив продуктов в холодильнике. Сначала пусть идут те, кто быстрее портятся. Если срок совпадает, то сортируйте по имени.
 
 5. Не все, что мы кладем в холодильник, является едой. Поэтому сделайте так, чтобы Storable не наследовался от Food. Мы по прежнему приносим еду домой, но некоторые продукты реализуют теперь 2 протокола. Холодильник принимает только те продукты, которые еще и Storable. функция сортировки должна по прежнему работать.
 */

protocol Things {
    var name: String { get }
}

protocol Food {
    var name: String { get }
    func taste()
}

protocol Storable: Things {
    var expired: Bool { get }
    var daysToExpire: Int { get }
    func putToFridge(_ text: String)
}

class Bread: Food {
    var name: String
    
    func taste() {
        print("mmm \(name) is important product!")
    }
    
    init(name: String) {
        self.name = name
    }
}

class Milk: Storable, Food {
    var name: String
    var expired: Bool {
        return daysToExpire == 0 ? false : true
    }
    var daysToExpire: Int
    func taste() {
        print("mmm \(name) is a cow milk, - it's tasty great!")
    }
    
    func putToFridge(_ text: String) {
        print(text)
    }
    
    init(name: String, daysToExp: Int) {
        self.name = name
        self.daysToExpire = daysToExp
    }
}

class Eggs: Storable, Food {
    var name: String
    var expired: Bool {
        return daysToExpire == 0 ? false : true
    }
    var daysToExpire: Int
    func taste() {
        print("mmm \(name) includes so much of proteins, - it is excellent to breakfast!")
    }
    func putToFridge(_ text: String) {
        print(text)
    }
    
    init(name: String, daysToExp: Int) {
        self.name = name
        self.daysToExpire = daysToExp
    }
}

class Butter: Storable, Food {
    var name: String
    var expired: Bool {
        return daysToExpire == 0 ? false : true
    }
    var daysToExpire: Int
    func taste() {
        print("mmm \(name) tastes good, but not so much!")
    }
    func putToFridge(_ text: String) {
        print(text)
    }
    
    init(name: String, daysToExp: Int) {
        self.name = name
        self.daysToExpire = daysToExp
    }
}

func random() -> Int {
    return Int(arc4random_uniform(5))
}

let bread = Bread(name: "Бородинский хлеб")
let milk = Milk(name: "Пастеризированное молоко", daysToExp: random())
let eggs = Eggs(name: "Яйца куриные", daysToExp: random())
let butter = Butter(name: "Масло селянское", daysToExp: random())
let milk2 = Milk(name: "Пастеризированное молоко2", daysToExp: random())
let eggs2 = Eggs(name: "Яйца куриные2", daysToExp: random())
let butter2 = Butter(name: "Масло селянское2", daysToExp: random())
let milk3 = Milk(name: "Пастеризированное молоко3", daysToExp: random())
let eggs3 = Eggs(name: "Яйца куриные3", daysToExp: random())
let butter3 = Butter(name: "Масло селянское3", daysToExp: random())

var productsArray: [Food] = [bread, milk, eggs, butter, milk2, eggs2, butter2, milk3, eggs3, butter3]

func sortMyArr(_ array: inout Array<Food>) {
        
    array.sort{
        return $0.name.lowercased() < $1.name.lowercased()
    }
}

func sortMyArr2(_ array: inout Array<Storable>) {
    array.sort(by: {a, b in
        if a.daysToExpire == b.daysToExpire {
            return a.name.lowercased() < b.name.lowercased()
        } else {
            return a.daysToExpire < b.daysToExpire
        }
    })
}

func printBagContains(_ array: [Food]) {

    var arrayV = array
    sortMyArr(&arrayV)
    
    for value in arrayV {
        value.taste()
    }
}

func printFridgeContains(_ array: [Food]) {
    var arr: [Storable] = []
    
    for value in array {
        if let product = value as? Storable {
            arr.append(product)
        }
    }
    
    sortMyArr2(&arr)
    for product in arr {
        if product.expired {
        product.putToFridge("Just put \(product.name) in fridge. It will expire in \(product.daysToExpire) days!")
        } else {
            print("\(product.name) expired and I'll throw out it!")
        }
    }
}

print("There are in my bag: ")
printBagContains(productsArray)

print("\nThere are in my fridge: ")
printFridgeContains(productsArray)





