import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var dict = Array(repeating: 0, count: N+2)
    
    for i in 1...N+1 {
        dict[i] = 0
    }
    
    for stage in stages {
        dict[stage] += 1
    }
    
    var rates = [(Float, Int)]()
    
    for i in 1...N {
        let reached = Array(dict[i...N+1]).reduce(0) { $0 + $1 }
        rates.append(((Float(dict[i]) / Float(reached)), i))
    }
    rates.sort(by: { $0.0 > $1.0 })
    
    var answer = [Int]()
    for i in rates {
        answer.append(i.1)
    }

    return answer
}