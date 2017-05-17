import UIKit

enum Direction : String {
    case Left = "Left!"
    case Right = "Right!"
}

enum Action {
    case Walk(meters: Int)
    case Run(meters: Int, speed: Double)
    case Stop
    case Turn(direction: Direction)
}

var action = Action.Run(meters: 20, speed: 15.0)
//action = .Stop
//action = .Walk(meters: 200)

//action = .Turn(direction: "Left") <- wrong!!!

//action = .Turn(direction: .Left)

var direction = Direction(rawValue: "Right!")
action = .Turn(direction: direction!)

switch action {
    case .Stop : print("Stop")
    //case .Walk (let meters) : print("Walk \(meters)")
    case .Walk (let meters) where meters < 100:
        print("Short walk")
    case .Walk :
        print("Long walk")
    case .Run (let m, let s) :
        print("run \(m) meters with speed \(s)")
    case .Turn (let dir) where dir == .Left :
        print("Turn left")
    case .Turn (let dir) where dir == .Right :
        print("Turn right")
    default: break
}

//print(Direction.Left.rawValue)
print(Direction.Left)






