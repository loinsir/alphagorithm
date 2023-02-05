import Foundation

func solution(_ operations:[String]) -> [Int] {
    
    var q = [Int]()
    
    for oper in operations {
        if oper.hasPrefix("I") {
            q.append(Int(oper.split(separator: " ").last!)!)
        } else if oper.hasPrefix("D 1") {
            q.sort(by: < )
            q.popLast()
        } else if oper.hasPrefix("D -1") {
            q.sort(by: > )
            q.popLast()
        }
    }
    
    q.sort(by: > )
    return q.isEmpty ? [0, 0] : [q.first!, q.last!]
}