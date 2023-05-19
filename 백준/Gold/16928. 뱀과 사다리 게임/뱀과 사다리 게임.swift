import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
var pos = 0

var map = Array(repeating: 0, count: 100)
var visited = Array(repeating: false, count: 100)
visited[0] = true
for _ in 0..<m+n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (row[0]-1, row[1]-1)
    map[u] = v
}

var q = [[Int]]() // pos, count
q.append([0, 0])
var idx = 0
var answer = Int.max

while idx < q.count {
    let currentPos = q[idx][0]
    if currentPos == 99 {
        answer = min(answer, q[idx][1])
        idx += 1
        continue
    }
    
    for i in 1...6 {
        var n = currentPos + i
        if n > 99 { continue }
        if map[n] != 0 {
            n = map[n]
        }
        if !visited[n] && n < 100 {
            visited[n] = true
            q.append([n, q[idx][1] + 1])
        }
    }
    
    idx += 1
}

print(answer)