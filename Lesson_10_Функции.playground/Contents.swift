import UIKit

// DRY

func calculateMoney(inWallet wallet: [Int], withType type: Int? = nil) -> (total: Int, count: Int) {
    
    var sum = 0
    var count = 0
    
    for value in wallet {

        if (type == nil) || (value == type!) {

            sum += value
            count += 1
        }
    }
    
    return (sum, count)
}

func calculateMoney(inSequence range: Int...) -> Int {
    
    var sum = 0
    
    for value in range {
        sum += value
    }
    
    return sum
}

let wallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]

var (money, count) = calculateMoney(inWallet: wallet)

money
count

calculateMoney(inWallet: wallet, withType: 5)

calculateMoney(inSequence: 5, 5, 10, 2, 3, 4, 3, 23, 34, 1, 1)

func sayHi() -> () {
    print("Hi!")
}

sayHi()

let hi : () -> () = sayHi

hi

func sayPhrase(phrase: String) -> Int? {
    print(phrase)
    return nil
}

sayPhrase(phrase: "aaa")

let phrase /*: (String) -> (Int?) */= sayPhrase(phrase:)

phrase("bbb")

func doSomething(whatToDo:()) {
    whatToDo
}

func whatToDo() -> () -> () {
    
    func printSomething() {
        print("hello world!")
    }
    
    return printSomething
}

doSomething(whatToDo: hi())

whatToDo()()

let iShouldDoThis = whatToDo()

iShouldDoThis()




















