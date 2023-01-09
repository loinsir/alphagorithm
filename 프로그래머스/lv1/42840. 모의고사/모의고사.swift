import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var first = Array(repeating: [1,2,3,4,5], count: 10000/5).flatMap{ $0 }
    var second = Array(repeating: [2,1,2,3,2,4,2,5], count: 10000/8).flatMap { $0 }
    var third = Array(repeating: [3,3,1,1,2,2,4,4,5,5], count: 10000/10).flatMap { $0 }
    
    var firstCount = 0
    var secondCount = 0
    var thirdCount = 0
    
    for i in 0..<answers.count {
        let answer = answers[i]
        if first[i] == answer {
            firstCount += 1
        }
        
        if second[i] == answer {
            secondCount += 1
        }
        
        if third[i] == answer {
            thirdCount += 1
        }
    }
    let counts = [firstCount, secondCount, thirdCount]
    
    let maxValue = counts.max()
    
    var results = [Int]()
    
    for i in 1...3 {
        if maxValue == counts[i-1] {
            results.append(i)
        }
    }
    
    return results
}