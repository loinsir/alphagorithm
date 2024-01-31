import Foundation

let t = Int(readLine()!)!
var board = [[Int]]()
for _ in 0..<t {
    let n = Int(readLine()!)!
    let row1 = readLine()!.split(separator: " ").map { Int(String($0))! }
    let row2 = readLine()!.split(separator: " ").map { Int(String($0))! }

    board = [row1, row2]
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: 2)
    dp[0][0] = row1[0]
    dp[1][0] = row2[0]

    if n >= 2 {
        dp[0][1] = board[0][1] + board[1][0]
        dp[1][1] = board[1][1] + board[0][0]
        for j in 2..<n {
            dp[0][j] = board[0][j] + max(dp[1][j-1], dp[0][j-2], dp[1][j-2])
            dp[1][j] = board[1][j] + max(dp[0][j-1], dp[0][j-2], dp[1][j-2])
        }
        print(max(dp[0][n-2], dp[1][n-2], dp[0][n-1], dp[1][n-1]))
    } else {
        print(max(dp[0][n-1], dp[1][n-1]))
    }
}