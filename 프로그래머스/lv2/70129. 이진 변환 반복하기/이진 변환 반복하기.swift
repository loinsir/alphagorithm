import Foundation

func solution(_ s:String) -> [Int] {
    var round = 0
    var count = 0
    
    var s = Array(s).map { String($0) }
    while s != ["1"] {
        // 1.
        var newS = 0
        for i in 0..<s.count {
            if s[i] == "0" {
                count += 1
            } else {
                newS += 1
            }
        }
        
        // 2.
        s = Array(String(newS, radix: 2)).map { String($0) }
        
        round += 1
    }
    
    return [round, count]
}