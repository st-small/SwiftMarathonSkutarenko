import UIKit

// ОСНОВЫ АЛГОРИТМОВ ****************************
/*
// O(1) const 
// O(logn) 
// O(n)
// O(nLogn)
// O(n^2)
// O(n^3)
// O(2^n)


// (1/6) * n^2 = O(n^2)
// 100000 = O(1)

// Сравнение скорости работы алгоритмов (первый пример -> O(nLogn), второй -> O(n))

func anagramSolution(_ str1: String, _ str2: String) -> Bool {
    
    var list1 = Array(str1.characters)
    var list2 = Array(str2.characters)
    
    list1 = list1.sorted(by: {$0 < $1}) // 2 * O(logn) + O(n) = O(nLogn)
    list2 = list2.sorted(by: {$0 < $1})
    
    var position = 0
    var matches = true
    
    while position < list1.count && matches {
        if list1[position] == list2[position] {
            position += 1
        } else {
            matches = false
        }
    }
    return matches
}

//func anagramCountSolution(_ str1: String, _ str2: String) -> Bool {
//    
//    var counter1 = repeatElement(0, count: 28)
//    var counter2 = repeatElement(0, count: 28)
//    
//    var aPos = 97 // 'a'
//    
//    for char in str1.unicodeScalars {
//        var pos = Int(Int(char.value) - aPos)
//        counter1[pos] = counter1[pos] + 1 // O(n)
//    }
//    
//    for char in str2.unicodeScalars {
//        var pos = Int(Int(char.value) - aPos)
//        counter2[pos] = counter2[pos] + 1 // O(n)
//    }
//    
//    var j = 0
//    var matched = true
//    
//    while j < 28 && matched {
//        if counter1[j] == counter2[j] { // O(n)
//            j += 1
//        } else {
//            matched = false
//        }
//    }
//    
//    return matched
//
//}

//anagramSolution("abc", "cba")
//anagramSolution("abc", "der")


// Пример рекурсивных методов

func listNum(_ numList: [Int]) -> Int {
    
    let size = numList.count
    assert(size > 0)
    
    var sum = 0
    
    for num in numList {
        sum += num
    }
    
    return sum
}

//[6, 5, 3, 2, 1]
//6 + rec([5, 3, 2, 1])....6 + 5 + 3 + 2 + rec([1])....

func recSum(_ numList: [Int]) -> Int {
    let size = numList.count
    assert(size > 0)
    
    return size == 1 ? numList.first! : numList.first! + recSum(Array(numList[1..<size]))

}

// 123456

func numToStringConverter(_ num: Int, _ base: Int) -> String {
    
    let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
    
    if num < base {
        return numbers[num]
    } else {
        return numToStringConverter(num / base, base) + numbers[num % base]
    }
}


listNum([5, 3])
recSum([5, 3])
numToStringConverter(124, 2)

// [5, 54, 7, 56, 3, 6, 7, 8, 9, 10] 6

func search(_ key: Int, _ list: [Int]) -> Int? {
    
    for i in list {
        if i == key {
            return i
        }
     }
    
    return nil
}

// O(n * n)

search(6, [1, 2, 6])

// [1, 2, 3, 4, 5, 6, 89, 456, 765] 456
// O(logn) * n + O(nlogn) = O(nLogn)

func binarySearch(_ key: Int, _ list: [Int]) -> Int? {
    
    var low = 0
    var high = list.count - 1
    
    while low <= high {
        
        let mid = low + (high - low) / 2
        
        if key < list[mid] {
            high = mid - 1
        } else if key > list[mid] {
            low = mid + 1
        } else {
            return mid
        }
    }
    
    return nil
}

binarySearch(456, [1, 2, 3, 4, 5, 6, 89, 456, 765])

/*
 //1 Определить асимптотику O(?) фрагментов кода
 
 //1.0 O(n^2)
 var test = 0
 var n = 100
 
 for i in 0...n {
 for j in 0...n {
 test = test * i * j
 }
 }
 
 // 1.1 O(n)
 for i in 0...n {
 test = test + i
 }
 
 for j in 0...n {
 test = test + j
 }
 
 // 1.2 O(logn)
 
 var temp = 0
 var i = n
 
 while i > 0 {
 temp = 5 + 7
 i = i / 2
 }
 
 //2 Написать рекурсивный разворот строки
 
 func reverseString(str: String) -> String {
 return ""
 }
 
 //3 Определить проблему в коде
 
 func rec(n: Int) -> String {
 var s = "\(rec(n - 3))" + "\(rec(n - 2))"
 if n <= 0 {
 return ""
 }
 return s
 }
 
 //4 Написать рекурсивный вариант бинарного поиска
 
 //5 Разобраться с хвостовой рекурсией. Оптимизирует ли ее Swift ?
 
 //6 Определить асимптотику работы алгоритма определения анаграмм с генерацией всех
 //возможных перестановок из cтроки s2 и поиска среди них s1
 */


func reverseString(_ str: String) -> String {
    let size = str.characters.count
    assert(size > 0)
    
    return size == 1 ? String(describing: str.characters.first!) : String(describing: str.characters.last!) + reverseString(str.substring(to: str.index(before: str.endIndex)))
}

reverseString("privet")

func binarySearchInRec(_ key: Int, _ list: [Int]) -> Int? {
    
    var low = 0
    var high = list.count - 1
    let mid = low + (high - low) / 2
    
    key < mid ? (high = mid - 1) : (low = mid + 1)
    
    return key == list[mid] ? mid : (low...high).lowerBound + binarySearchInRec(key, Array(list[low...high]))!
}

binarySearchInRec(5, [1, 2, 3, 4, 5, 6, 89, 456, 765])
*/

// АЛГОРИТМЫ СОРТИРОВКИ **********************************

var list = [1, 2, 3, 4, 98, 1, 4, 123, 11, 82]

//func bubbleSort <T: Comparable> (list: inout [T]) {
//    
//    let size = list.count
//    
//    for i in 0..<size {
//        var pass = (size - 1) - i
//        
//        for j in 0..<pass {
//            
//            var key = list[j]
//            
//            if key > list[j + 1] {
//                
//                let temp = list[j + 1]
//                list[j + 1] = key
//                list[j] = temp
//            }
//        }
//    }
//}
//
//bubbleSort(list: &list)

// ***********************************

// n (0, k) k => O(n)

//func countedSort(_ list: [Int], _ maxVal: Int) -> [Int] {
//    
//    let size = list.count
//    let m = maxVal + 1
//    var container = [Int](repeatElement(0, count: m)) // [0, 0, .... 0]
//    
//    for j in list {
//        container[j] += 1
//    }
//    
//    var outer = [Int](repeatElement(0, count: size))
//    var i = 0
//    
//    for a in 0..<m {
//        for c in 0..<container[a] {
//            outer[i] = a
//            i += 1
//        }
//    }
//    
//    return outer
//}
//
//countedSort(list, 123)

// ***********************************

// [1, 2, 5] [4, 6, 7, 9]
// [1, 2, 4, 5, 6, 7, 9]

//func merge <T: Comparable> (_ list: [T], _ list2: [T]) -> [T] {
//    
//    if list.count == 0 {
//        return list2
//    } else if list2.count == 0 {
//        return list
//    } else if list[0] < list2[0] {
//        return [list[0]] + merge(Array(list[1..<list.count]), list2)
//    } else {
//        return [list2[0]] + merge(list, Array(list2[1..<list2.count]))
//    }
//}
//
//let a = [1, 2, 5]
//let b = [4, 6, 7, 9]
//
//merge(a, b)
//
//func mergeSort <T: Comparable> (_ list: [T]) -> [T] {
//    
//    if list.count < 2 {
//        return list
//    } else {
//        let half = Int(list.count/2)
//        return merge(mergeSort(Array(list[0..<half])), mergeSort(Array(list[half..<list.count])))
//    }
//}
//
//mergeSort(list)

// divide  : O(1)
// conquer : T(n) => 2 * T(n / 2) : O(logn)
// combine : O(n) = 
// Total   : => O(nlogn)

// ***********************************

// quickSort(list)

//list = [9, 6, 7, 3, 42, 2, 78, 4, 5, 67, 98, 1]
//
//func quickSort <T: Comparable> (_ list: [T]) -> [T] {
//    
//    if list.count > 1 {
//        var less:[T] = []
//        var equal:[T] = []
//        var greater:[T] = []
//        
//        let pivot = list[1]
//        
//        for elem in list {
//            if elem < pivot {
//                less.append(elem)
//            } else if elem == pivot {
//                equal.append(elem)
//            } else {
//                greater.append(elem)
//            }
//        }
//        return quickSort(less) + equal + quickSort(greater)
//    } else {
//        return list
//    }
//}
//
//quickSort(list)
//
//list = [9, 6, 7, 3, 42, 2, 78, 4, 5, 67, 98, 1]
//
//func quickSort2 <T: Comparable> (_ list: [T]) -> [T] {
//    
//    if list.count == 0 {
//        return []
//    }
//    
//    let pivot = list[0]
//    let sublist = list.count > 1 ? list[1..<list.count] : []
//    let smaller = sublist.filter{$0 <= pivot}
//    let greater = sublist.filter{$0 > pivot}
//    
//    var temp = quickSort2(smaller) + [pivot]
//    temp += quickSort2(greater)
//    
//    return temp
//}
//
//quickSort2(list)
//
//
//func quickSort3 <T: Comparable> (_ list: inout [T], _ start: Int, _ end: Int) {
//    
//    if end - start < 2 {
//        return
//    }
//    
//    let pivot = list[start + (end - start) / 2]
//    var low = start
//    var high = end - 1
//    
//    while (low <= high) {
//        if list[low] < pivot {
//            low += 1
//            continue
//        }
//        
//        if list[high] > pivot {
//            high -= 1
//            continue
//        }
//        
//        let temp = list[low]
//        list[low] = list[high]
//        list[high] = temp
//        
//        low += 1
//        high -= 1
//    }
//    
//    quickSort3(&list, start, high + 1)
//    quickSort3(&list, high + 1, end)
//}
//
//quickSort3(&list, 0, list.count)

// ЭЛЕМЕНТАРНЫЕ СТРУКТУРЫ ДАННЫХ **********************************

// LIFO - last in first out

// push
// pop
// isEmpty
// size
// top

//struct Stack <T> {
//    
//    var container = [T]()
//    
//    var isEmpty: Bool {
//        return container.isEmpty
//    }
//    
//    var top: T? {
//        return container.last
//    }
//    
//    var size: Int {
//        return container.count
//    }
//    
//    mutating func push(_ element: T) {
//        container.append(element)
//    }
//    
//    mutating func pop() -> T? {
//        if !isEmpty {
//            return container.removeLast()
//        }
//        
//        return nil
//    }
//}
//
//var stack = Stack<String>()
//stack.isEmpty
//stack.pop()
//
//stack.push("a")
//stack.push("b")
//stack.push("c")
//
//stack.size
//stack.pop()
//stack.top

// FIFO - first in first out

// enqueue
// dequeue
// isEmpty
// size
// head
// tail

//struct Queue <T> {
//    
//    var container = [T]()
//    
//    var isEmpty: Bool {
//        return container.isEmpty
//    }
//    
//    var size: Int {
//        return container.count
//    }
//    
//    var head: T? {
//        return container.first
//    }
//    
//    var tail: T? {
//        return container.last
//    }
//    
//    mutating func enqueue(_ element: T) {
//        container.append(element)
//    }
//    
//    mutating func dequeue() -> T? {
//        if !isEmpty {
//            return container.remove(at: 0)
//        }
//        
//        return nil
//    }
//}
//
//var queue = Queue<String>()
//queue.isEmpty
//queue.enqueue("abc")
//queue.enqueue("def")
//queue.enqueue("ghi")
//
//queue.head
//queue.tail
//
//queue.size
//
//queue.dequeue()
//queue.dequeue()
//queue.dequeue()
//
//queue.dequeue()

//MARK: - Deque

// addFirst
// addLast
// removeFirst
// removeLast
// head
// tail
// isEmpty
// size

//struct Deque <T> {
//    
//    var container = [T]()
//    
//    var isEmpty: Bool {
//        return container.isEmpty
//    }
//    
//    var size: Int {
//        return container.count
//    }
//    
//    var head: T? {
//        return container.first
//    }
//    
//    var tail: T? {
//        return container.last
//    }
//    
//    mutating func addFirst(_ element: T) {
//        container.insert(element, at: 0)
//    }
//    
//    mutating func addLast(_ element: T) {
//        container.append(element)
//    }
//    
//    mutating func removeFirst() -> T? {
//        if !isEmpty {
//            return container.remove(at: 0)
//        }
//        
//        return nil
//    }
//    
//    mutating func removeLast() -> T? {
//        if !isEmpty {
//            return container.removeLast()
//        }
//        
//        return nil
//    }
//}

// [1, 2, 3]
// [_, _, _, _]

// [1, 2, 3]
// [_, _, _, _, _, _]

//MARK: СВЯЗАННЫЙ СПИСОК

// # => # => nil
// # <==> #

class Node <T: Equatable> {
    
    var item: T
    var next: Node<T>?
    
    init(element: T) {
        item = element
    }
    
    func add(newItem: T) {
        if let nextNode = next {
            nextNode.add(newItem: newItem)
        } else {
            next = Node<T>(element: newItem)
        }
    }
}

class LinkedList <T: Equatable> {
    
    var head: Node<T>?
    
    func add(item: T) {
        if head != nil {
            head!.add(newItem: item)
        } else {
            head = Node(element: item)
        }
    }
    
    func remove(item: T) {
        if head != nil {
            if head!.item == item {
                head = head!.next
            } else {
                var current = head
                var prev = head
                
                while current!.next != nil && current!.item != item {
                    prev = current
                    current = current!.next
                }
                
                if let deleted = current {
                    if deleted.item == item {
                        if let nexter = deleted.next {
                            prev?.next = nexter
                            deleted.next = nil
                        } else {
                            prev?.next = nil
                        }
                    }
                }
             }
        }
    }
    
    var size: Int {
        var current = head
        var counter = 0
        while current != nil {
            current = current?.next
            counter += 1
        }
        
        return counter
    }
}

extension LinkedList {
    
    func print() -> String {
        var str = ""
        var current = head
        while current != nil {
            str += "\(current!.item) => "
            current = current?.next
        }
        
        return str
    }
}

var linkedList = LinkedList<String>()

linkedList.add(item: "abc")
linkedList.add(item: "def")
linkedList.add(item: "ghi")
linkedList.add(item: "jkl")

print(linkedList.print())
print(linkedList.size)

linkedList.remove(item: "def")
linkedList.remove(item: "abc")
linkedList.remove(item: "fdf")
linkedList.remove(item: "jkl")
linkedList.remove(item: "ghi")

print(linkedList.print())
print(linkedList.size)











