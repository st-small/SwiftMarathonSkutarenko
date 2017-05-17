import UIKit

let numbers = [4, 3, 12, 7, 6, 3, 56, 7, 8, 9, 10, 4, 3, 1, 8, 11]

func filterArray(array: [Int], f: (Int) -> Bool) -> [Int] {
    
    var filtered = [Int]()
    
    for i in array {
        if f(i) {
            filtered.append(i)
        }
    }
    
    return filtered
}

//func compare(i: Int) -> Bool {
//    
//    return i % 2 == 0
//}



//filterArray(array: numbers, f: {(i: Int) -> Bool in
//    return i % 2 == 0
//})
//
//filterArray(array: numbers, f: {(i: Int) -> Bool in
//    return i % 2 == 1
//})
//
//filterArray(array: numbers, f: {(i: Int) -> Bool in
//    return i % 3 == 1
//})
//
//filterArray(array: numbers, f: {(i: Int) -> Bool in
//    return i % 10 == 0
//})


filterArray(array: numbers, f: {i in
    return i % 2 == 0
})

let a =
    filterArray(array: numbers, f: {i in i % 2 == 1})

let a1 =
    filterArray(array: numbers, f: {$0 % 3 == 0})

let a3 =
    filterArray(array: numbers) {$0 % 3 == 0}

let array = [1, 2, 3, 5, 7, 123]

var count = 0

let a4 =
    filterArray(array: numbers) {value in
    
    for include in array {
        count += 1
        if include == value {
            return true
        }
    }
    return false
}

count
count = 0

var dict = [Int:Bool]()
for value in array {
    count
    dict[value] = true
}

let a5 =
    filterArray(array: numbers) {value in
        count += 1
        return dict[value] != nil
}

count



















