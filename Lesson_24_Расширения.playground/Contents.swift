import UIKit

extension Int {
    
    var isEven : Bool {
        return self % 2 == 0
    }
    
    var isOdd : Bool {
        return !isEven
    }
    
    enum EvenOrOdd : String {
        case Even = "even"
        case Odd = "odd"
    }
    
    var evenOrOdd : EvenOrOdd {
        return isEven ? .Even : .Odd
    }
    
    func pow(value: Int) -> Int {
        var temp = self
        for _ in 1..<value {
            temp *= self
        }
        return temp
    }
    
    mutating func powTo(value: Int) {
        self = pow(value: value)
    }
    
    var binaryString : String {
        
        var result = ""
        
        for i in 0..<8 {
            result = String(self & (1 << i) > 0) + result
        }
        
        return result
    }
}

extension String {
    init(_ value: Bool) {
        self.init(value ? 1 : 0)
    }
    
    subscript(start: Int, length: Int) -> String {
        let start   = index(startIndex, offsetBy: start)
        let end     = index(start, offsetBy: length)
        let range   = Range(uncheckedBounds: (lower: start, upper: end))
        return self[range]
    }
}

extension Int.EvenOrOdd {
    
    var string : String {
        switch self {
        case .Even: return "-even"
        case .Odd: return "-odd"
        }
    }
}

var a = 5

if a % 2 != 0 {
    print("a")
}

if a.isOdd {
    print("a")
}

print(a.evenOrOdd.string)

a.pow(value: 2)
a.powTo(value: 4)
a
a = 33
a.binaryString

let s = "Hello, World!"
s[0,5]














