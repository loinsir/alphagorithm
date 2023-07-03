import Foundation

let dice = readLine()!.split(separator: " ").map { Int(String($0))! }

var maxPoint = 0
var horses = [Horse](repeating: (0, 0), count: 4)

var root = [[Int]](repeating: [Int](), count: 5)
root[0] = (0...19).map { $0 * 2 }
root[1] = [0, 13, 16, 19]
root[2] = [0, 22, 24]
root[3] = [0, 28, 27, 26]
root[4] = [25, 30, 35, 40, 0]

typealias Horse = (root: Int, position: Int)

func move(_ horse: Horse, _ jump: Int) -> (Horse, Int) {
    switch horse.root {
        case 0:
        let nextPosition = horse.position + jump
        
        if nextPosition > 20 {
            return ((4, 4), 0)
        } else if nextPosition == 20 {
            return ((4, 3), 40)
        } else if root[0][nextPosition] == 10 {
            return ((1, 0), root[0][nextPosition])
        } else if root[0][nextPosition] == 20 {
            return ((2, 0), root[0][nextPosition])
        } else if root[0][nextPosition] == 30 {
            return ((3, 0), root[0][nextPosition])
        } else {
            return ((0, nextPosition), root[0][nextPosition])
        }
        
        case 1:
        if horse.position + jump > 3 {
            return ((4, horse.position + jump - 4), root[4][horse.position + jump - 4])
        } else {
            return ((1, horse.position + jump), root[1][horse.position + jump])
        }
        
        case 2:
        if horse.position + jump > 2 {
            return ((4, horse.position + jump - 3), root[4][horse.position + jump - 3])
        } else {
            return ((2, horse.position + jump), root[2][horse.position + jump])
        }
        
        case 3:
        if horse.position + jump > 3 {
            return ((4, horse.position + jump - 4), root[4][horse.position + jump - 4])
        } else {
            return ((3, horse.position + jump), root[3][horse.position + jump])
        }
        
        case 4:
        let nextPosition = min(4, horse.position + jump)
        return ((4, nextPosition), root[4][nextPosition])
        
        default:
        fatalError("invalid root")
    }
}

func play(_ turn: Int, _ point: Int) {
    guard turn < 10 else { 
        if maxPoint < point {
            maxPoint = point
        }
        return
    }
    
    for horseIdx in 0..<4 where horses[horseIdx] != (4, 4) {
        let horse = horses[horseIdx]
        
        let (nextHorse, getPoint) = move(horses[horseIdx], dice[turn])
        var canMove = true
        for check in 0..<4 where horses[check] != (4, 4) && check != horseIdx {
            if horses[check] == nextHorse {
                canMove = false
                break
            }
        }
        
        if canMove {
            horses[horseIdx] = nextHorse
            play(turn + 1, point + getPoint)
            horses[horseIdx] = horse
        }
    }
}

play(0, 0)
print(maxPoint)