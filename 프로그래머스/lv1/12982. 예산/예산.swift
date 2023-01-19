import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var answer = 0
    var d = d.sorted(by: < ), budget = budget
    
    for i in d {
        budget -= i
        if budget >= 0 {
            answer += 1
        }
    }
    
    return answer
}