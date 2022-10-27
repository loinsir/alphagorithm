var dp = Array(repeating: Array(repeating: Array(repeating: 1, count: 51), count: 51), count: 51)
for a in 0...20 {
    for b in 0...20 {
        for c in 0...20 {
            if a < b && b < c && b > 0 {
                dp[a][b][c] = dp[a][b][c-1] + dp[a][b-1][c-1] - dp[a][b-1][c]
            } else if a > 0 && b > 0 && c > 0 {
                dp[a][b][c] = dp[a-1][b][c] + dp[a-1][b-1][c] + dp[a-1][b][c-1] - dp[a-1][b-1][c-1]
            }
        }
    }
}
for a in 0...50 {
    for b in 0...50 {
        for c in 0...50 {
            if a == 0 || b == 0 || c == 0 {
                dp[a][b][c] = 1
            } else if a > 20 || b > 20 || c > 20 {
                dp[a][b][c] = dp[20][20][20]
            }
        }
    }
}

while true {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = input[0], b = input[1], c = input[2]

    if a == -1, b == -1, c == -1 {
        break
    }

    var aVal = a
    var bVal = b
    var cVal = c
    if a < 0 {
        aVal = 0
    }
    if b < 0 {
        bVal = 0
    }
    if c < 0 {
        cVal = 0
    }
    print("w(\(a), \(b), \(c)) = \(dp[aVal][bVal][cVal])")
}