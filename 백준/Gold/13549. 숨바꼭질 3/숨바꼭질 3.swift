import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (input[0], input[1])

if n >= k {
    print(n-k)
} else {
    var q = [[Int]]()
    q.append([n, 0]) // position, time
    var idx = 0
    var visited = Set<Int>()
    visited.insert(n)

    var answer = Int.max
    while idx < q.count {
        let current = q[idx][0], time = q[idx][1]
        
        if current == k {
            answer = min(answer, time)
            idx += 1
            continue
        }
        
        let prev = current - 1, next = current + 1, moving = current * 2
        let targets = [moving, prev, next]
        for i in 0..<3 {
            if 0...100000 ~= targets[i] && !visited.contains(targets[i]) {
                visited.insert(targets[i])
                if i == 0 {
                    q.append([targets[i], time])
                } else {
                    q.append([targets[i], time + 1])
                }
            }
        }
        idx += 1
    }
    print(answer)
}