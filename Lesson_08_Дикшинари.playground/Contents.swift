import UIKit

//let dict : [String:String] = ["яблоко" : "apple", "груша" : "pear"]
//let dict2 : [Int:String] = [0 : "apple", 1 : "pear"]
//let dict3 : Dictionary<String, Double> = ["a" : 2.0]

var dict = ["яблоко" : "apple", "груша" : "pear"]

dict["груша"]
//dict2[1]

dict.count
dict.isEmpty

var dict3 = [String:String]()

dict3.count
dict3.isEmpty

dict["апельсин"] = "orange"

dict

Array(dict.keys)
Array(dict.values)

dict.updateValue("yabloko", forKey: "яблоко")

//let fruit : String? = dict["яблоко"]


if let fruit = dict["яблоко2"] {
    print("\(fruit)")
} else {
    print("no value for key fruit")
}

//dict["яблоко"] = nil
//dict

//dict.removeValue(forKey: "яблоко")
//dict

//dict = [:]
//dict.isEmpty

for key in dict.keys {
    print("key = \(key), value = \(dict[key]!)")
}

for (key, value) in dict {
    print("key = \(key), value = \(value)")
}



