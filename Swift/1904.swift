let N = Int(readLine()!)!

var dp: [Int] = Array(repeating: 1, count: 1000001)
dp[2] = 2

if N >= 3 {
    for i in 2...N {
        dp[i] = (dp[i-1] + dp[i-2]) % 15746
    }
}

print(dp[N])