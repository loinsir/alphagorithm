import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var q1 = queue1
    var q2 = queue2
    var qIdx1 = 0
    var qIdx2 = 0
    
    var answer = 0
    
    var sum1 = q1.reduce(0, +)
    var sum2 = q2.reduce(0, +)
    
    while sum1 != sum2 {
        
        if sum1 > sum2 {
            sum2 += q1[qIdx1]
            sum1 -= q1[qIdx1]
            q2.append(q1[qIdx1])
            qIdx1 += 1
        } else if sum1 < sum2 {
            sum1 += q2[qIdx2]
            sum2 -= q2[qIdx2]
            q1.append(q2[qIdx2])
            qIdx2 += 1
        } else {
            break
        }

        answer += 1

        if answer == 600000 {
            return -1
        }
    }
    
    return answer
}