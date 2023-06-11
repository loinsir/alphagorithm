import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, l, r) = (input[0], input[1], input[2])

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: true, count: n), count: n)

for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(row)
}

let dy = [1, 0, -1, 0], dx = [0, 1, 0, -1]

func bfs(_ y: Int, _ x: Int) -> Int {
    var q = [[Int]]()
    q.append([y, x])
    visited[y][x] = true
    var idx = 0
    var sum = map[y][x]
    
    while idx < q.count {
        let popped = q[idx]
        let cy = popped[0], cx = popped[1]
        
        for i in 0..<4 {
            let ny = cy + dy[i], nx = cx + dx[i]
            
            if 0..<n ~= ny && 0..<n ~= nx && !visited[ny][nx] && l...r ~= abs(map[cy][cx] - map[ny][nx]) {
                visited[ny][nx] = true
                sum += map[ny][nx]
                q.append([ny, nx])
            }
        }
        
        idx += 1
    }
    
    sum = Int(floor(Double(sum) / Double(q.count)))
    
    for i in 0..<q.count {
        let popped = q[i]
        let cy = popped[0], cx = popped[1]
        map[cy][cx] = sum
    }
    
    return q.count
}

var answer = 0

while true {
    for i in 0..<n {
        for j in 0..<n {
            visited[i][j] = false
        }
    }
    
    var flag = false
    
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] {
                if bfs(i, j) > 1 {
                    flag = true
                }
            }
        }
    }


    if !flag {
        break
    }
    answer += 1
}
print(answer)