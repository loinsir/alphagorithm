import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var count = 0
    var maps = Array(repeating: 1, count: n)
    
    for i in lost {
        maps[i-1] = 0
    }
    
    for i in reserve {
        maps[i-1] += 1
    }
    
    for i in 0..<maps.count {
        if maps[i] == 0 {
            if i-1 >= 0 && maps[i-1] == 2 {
                maps[i-1] -= 1
                count += 1
            } else if i+1 < maps.count && maps[i+1] == 2 {
                maps[i+1] -= 1
                count += 1
            }
        } else {
            count += 1
        }
    }
    
    return count
}