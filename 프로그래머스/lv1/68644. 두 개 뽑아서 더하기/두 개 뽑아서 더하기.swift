import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var answerSet = Set<Int>()
    for i in 0..<numbers.count-1 {
        for j in i+1..<numbers.count {
            answerSet.insert(numbers[i]+numbers[j])
        }
    }
    
    return Array(answerSet).sorted(by: < )
}