import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m, n) = (input[0], input[1])
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: Int.max, count: m), count: n)

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

for i in 0..<n {
    let row = Array(readLine()!).map { Int(String($0))! }
    map.append(row)
}

func bfs() {
    var q = [[Int]]()
    q.append([0, 0, 0])
    visited[0][0] = 0
    var idx = 0
    
    while idx < q.count {
        
        let popped = q[idx]
        let y = popped[0], x = popped[1], cracked = popped[2]
        
        if y == n - 1 && x == m - 1 {
            idx += 1
            continue
        }

        for i in 0..<4 {
            let ny = y + dy[i], nx = x + dx[i]
            
            if 0..<n ~= ny && 0..<m ~= nx && visited[ny][nx] > cracked + map[ny][nx] {
                visited[ny][nx] = cracked + map[ny][nx]
                q.append([ny, nx, cracked + map[ny][nx]])
            }
        }
        
        idx += 1
    }
}
bfs()

print(visited[n-1][m-1])