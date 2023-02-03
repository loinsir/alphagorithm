import Foundation

func solution(_ citations:[Int]) -> Int {
    if citations.count == 1 {
        return citations.first!
    }
    
    var answer = 0
    var citations = citations.sorted(by: >)
    
    for i in 0..<citations.count {
        if citations[i] <= citations.count - i - 1 && citations[i] >= i+1 {
            answer = max(answer, citations[i])
        }
    }
    
    return answer
}