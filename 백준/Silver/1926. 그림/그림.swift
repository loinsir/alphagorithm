import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var map = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(row)
}

var visited = Array(repeating: Array(repeating: false, count: m), count: n)

let dy = [1, 0, -1, 0], dx = [0, 1, 0, -1]
func bfs(_ y: Int, _ x: Int) -> Int { // return size
    if visited[y][x] || map[y][x] == 0 {
        return 0
    }
    
    var size = 1
    var q = [[Int]]()
    var idx = 0
    q.append([y, x])
    visited[y][x] = true
    
    while idx < q.count {
        let popped = q[idx]
        
        for i in 0..<4 {
            let ny = popped[0] + dy[i], nx = popped[1] + dx[i]
            if 0..<n ~= ny && 0..<m ~= nx && !visited[ny][nx] && map[ny][nx] == 1 {
                q.append([ny, nx])
                visited[ny][nx] = true
                size += 1
            }
        }
        
        idx += 1
    }
    
    return size
}

var count = 0
var maxSize = 0
for i in 0..<n {
    for j in 0..<m {
        let size = bfs(i, j)
        
        if size > 0 {
            count += 1
            maxSize = max(maxSize, size)
        }
    }
}

print(count)
print(maxSize)