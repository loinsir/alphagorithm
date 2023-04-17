import Foundation

func solution(_ a:[Int]) -> Int {
    
    if a.count <= 3 {
        return a.count
    }
    
    var minVal = Int.max
    var minValIdx = 0
    
    for i in 0..<a.count {
        if minVal > a[i] {
            minVal = a[i]
            minValIdx = i
        }
    }
    
    var answer = 1
    var startMinVal = Int.max
    for i in 0..<minValIdx {
        if startMinVal > a[i] {
            startMinVal = a[i]
            answer += 1
        }
    }
    
    startMinVal = Int.max
    for i in stride(from: a.count-1, to: minValIdx, by: -1) {
        if startMinVal > a[i] {
            startMinVal = a[i]
            answer += 1
        }
    }
    
    return answer
}