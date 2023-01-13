import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var absolutes = absolutes
    var result = 0
    
    for i in 0..<signs.count {
        if signs[i] {
            result += absolutes[i]
        } else {
            result -= absolutes[i]
        }
    }
    
    return result
}