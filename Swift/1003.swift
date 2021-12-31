let T = Int(readLine()!)!

var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 41)

dp[0][0] = 1
dp[0][1] = 0

dp[1][0] = 0
dp[1][1] = 1

for i in 2...40 {
    dp[i][0] = dp[i-1][0] + dp[i-2][0]
    dp[i][1] = dp[i-1][1] + dp[i-2][1]
}

for _ in 1...T {
    let order = Int(readLine()!)!

    print("\(dp[order][0]) \(dp[order][1])")
}