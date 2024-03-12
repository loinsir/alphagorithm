import Foundation

let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m, n) = (mn[0], mn[1])

var board = [[Int]]()

for _ in 0..<m {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(row)
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
var answer = 0
let dy = [-1, 0, 1, 0], dx = [0, 1, 0, -1]

func dfs(_ y: Int, _ x: Int) -> Int {
    if y == m-1 && x == n-1 {
        return 1
    }

    for i in 0..<4 {
        let ny = y + dy[i], nx = x + dx[i]

        if 0..<m ~= ny && 0..<n ~= nx && board[ny][nx] < board[y][x] {
            if dp[ny][nx] > 0 {
                dp[y][x] += dp[ny][nx]
            } else if dp[ny][nx] == 0 {
                dp[y][x] += dfs(ny, nx)
            }
        }
    }

    if dp[y][x] == 0 {
        dp[y][x] -= 1
        return 0
    } else {
        return dp[y][x]
    }
}

answer = dfs(0, 0)
print(answer == -1 ? 0 : answer)