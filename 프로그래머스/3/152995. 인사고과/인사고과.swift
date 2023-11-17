import Foundation

func solution(_ scores:[[Int]]) -> Int {
    
    var wanho = scores[0]
    var scores = scores.sorted(by: { $0[0] != $1[0] ? $0[0] > $1[0] : $0[1] < $1[1] })
    var candidates = [[Int]]()
    
    var maxScore = 0
    var answer = 1
    for i in 0..<scores.count {
        if scores[i][1] < maxScore { //탈락
            if scores[i] == wanho {
                return -1
            }
        } else {
            maxScore = max(maxScore, scores[i][1])
            if scores[i][0] + scores[i][1] > wanho[0] + wanho[1] {
                answer += 1
            }
        }
    }
    return answer
}