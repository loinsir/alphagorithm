import Foundation

let N = Int(readLine()!)!
var board = [[String]]()
var visited = Array(repeating: Array(repeating: false, count: N), count: N)

for _ in 0..<N {
    let input = Array(readLine()!).map { String($0) }
    board.append(input)
}

let dy = [1, 0, -1, 0], dx = [0, 1, 0, -1]

func bfs(_ y: Int, _ x: Int) -> Int {
    if visited[y][x] {
        return 0
    }
    
    let mark = board[y][x]
    
    var q = [[Int]]() // [y, x]
    q.append([y, x])
    visited[y][x] = true
    var idx = 0
    
    while idx < q.count {
        let popped = q[idx]
        let cy = popped[0], cx = popped[1]
        
        for i in 0..<4 {
            let ny = cy + dy[i], nx = cx + dx[i]
            
            if 0..<N ~= ny && 0..<N ~= nx && board[ny][nx] == mark && !visited[ny][nx] {
                visited[ny][nx] = true
                q.append([ny, nx])
            }
        }
        idx += 1
    }
    return 1
}

func bfs2(_ y: Int, _ x: Int) -> Int {
    if visited[y][x] {
        return 0
    }
    
    let mark = board[y][x]
    
    var q = [[Int]]() // [y, x]
    q.append([y, x])
    visited[y][x] = true
    var idx = 0
    
    while idx < q.count {
        let popped = q[idx]
        let cy = popped[0], cx = popped[1]
        
        for i in 0..<4 {
            let ny = cy + dy[i], nx = cx + dx[i]

            if 0..<N ~= ny && 0..<N ~= nx && !visited[ny][nx] {
                if board[ny][nx] == mark || board[ny][nx] == "G" && mark == "R" || board[ny][nx] == "R" && mark == "G" {
                    visited[ny][nx] = true
                    q.append([ny, nx])
                }
            }
        }
        idx += 1
    }
    return 1
}

var normal = 0, blind = 0
for i in 0..<N {
    for j in 0..<N {
        normal += bfs(i, j)
    }
}

visited = Array(repeating: Array(repeating: false, count: N), count: N)
for i in 0..<N {
    for j in 0..<N {
        blind += bfs2(i, j)
    }
}

print(normal, blind)