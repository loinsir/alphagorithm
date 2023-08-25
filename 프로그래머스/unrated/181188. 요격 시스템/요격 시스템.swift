import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var targets = targets.sorted(by: { 
        $0[0] != $1[1] ? $0[0] < $1[0] : $0[1] < $1[1]
    })
    
    var count = 0
    var bound = 0
    for target in targets {
        if bound > target[0] {
            bound = min(bound, target[1])
        } else {
            bound = target[1]
            count += 1
        }
    }
    
    return count
}