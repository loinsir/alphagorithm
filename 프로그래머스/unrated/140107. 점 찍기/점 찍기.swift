import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    
    var answer: Int64 = 0
    
    for x in 0...d/k {
        answer += Int64(sqrt(pow(Double(d)/Double(k), 2) - pow(Double(x), 2))) + 1
    }
    
    return answer 
}