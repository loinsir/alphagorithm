import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progressWithSpeeds = [[Int]]()
    for i in 0..<progresses.count {
        progressWithSpeeds.append([progresses[i], speeds[i]])
    }
    
    var queue = progressWithSpeeds
    var result = [Int]()
    while !queue.isEmpty {
        var tmp = 0
        queue = queue.map { [[$0[1] + $0[0], 100].min()!, $0[1]] }
        
        for i in queue {
            if i[0] >= 100 {
                tmp += 1
            } else {
                break
            }
        }
        if tmp > 0 {
            result.append(tmp)
            for i in 1...tmp {
                queue.removeFirst()
            }
        }
    }
    
    return result
}