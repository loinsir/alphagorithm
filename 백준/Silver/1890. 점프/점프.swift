import Foundation

let n = Int(readLine()!)!
var board = [[Int]]()

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)    
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
dp[0][0] = 1

for y in 0..<n {
    for x in 0..<n where board[y][x] != 0 {
        let nx = x + board[y][x]
        let ny = y + board[y][x]

        if nx < n {
            dp[y][nx] += dp[y][x]
        }

        if ny < n {
            dp[ny][x] += dp[y][x]
        }
    }
}

print(dp[n-1][n-1])