import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m, n) = (input[0], input[1])

var map = [[Int]]()
for _ in 0..<m {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(row)
}
var answer = 0
let dy = [-1, 0, 1, 0], dx = [0, 1, 0, -1]

var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
func dfs(_ y: Int, _ x: Int) -> Int {
    if y == m - 1 && x == n - 1 {
        return 1
    }
    
    for i in 0..<4 {
        let ny = y + dy[i], nx = x + dx[i]
        
        if 0..<m ~= ny && 0..<n ~= nx && map[ny][nx] < map[y][x] {
            if dp[ny][nx] > 0 {
                dp[y][x] += dp[ny][nx]
            } else if dp[ny][nx] == 0 {
                dp[y][x] += dfs(ny, nx)
            }
        }
    }
    
    if dp[y][x] == 0 { // 지금 현재 있는 곳은 도착 지점에 도달 못하는 곳
        dp[y][x] -= 1
        return 0
    } else {
        return dp[y][x]
    }
}
answer = dfs(0, 0)
print(answer == -1 ? 0 : answer)