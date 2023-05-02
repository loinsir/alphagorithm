import Foundation

func solution(_ cards:[Int]) -> Int {
    var answer = [Int]()
    var cards = cards
    var startIdx = 0
    var sum = 0
    
    while true {
        for i in 0..<cards.count {
            if cards[i] > 0 {
                startIdx = i
                break
            }
        }
        
        var count = 0
        while true {
            count += 1
            var idx = startIdx
            startIdx = cards[idx] - 1
            cards[idx] = 0
            if cards[startIdx] == 0 {
                break
            }
        }
        sum += count
        answer.append(count)
        
        if sum == cards.count {
            if answer.count < 2 {
                return 0
            } else {
                answer.sort(by: >)
                return answer[0] * answer[1]
            }
        }
    }
}