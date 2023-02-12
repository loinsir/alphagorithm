import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var count = 1
    var dup = 0
    var dict = [String: Int]()
    var previous: [String] = []
    
    for word in words {
        if dict[word] == nil && (previous.isEmpty || previous.last! == Array(word).map{String($0)}.first!) {
            dict[word] = count
            previous = Array(word).map { String($0) }
            count += 1
            if count > n { count -= n }
            dup += 1
        } else {
            return [count, dup / n + 1]
        }
    }
    
    return [0, 0]
}