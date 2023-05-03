import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var position: [(Int, Int)] = [(1, 1), (2, 3), (2, 4), (3, 2), (3, 4), (4, 2), (4, 3)]
    var answer: Int = 0
    var dict: [Int: Int] = [:]
    
    for w in weights {
        for p in position {
            var n = w * p.0
            guard n % p.1 == 0 else { continue }
            n /= p.1
            guard dict[n] != nil else { continue }
            answer += dict[n]!
        }
        
        if dict[w] == nil {
            dict[w] = 1
        } else {
            dict[w]! += 1
        }
    }
    
    return Int64(answer)
}