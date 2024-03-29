let n = Int(readLine()!)!

if n < 4 {
    print(n-1)
} else {
    var dp = Array(repeating: 0, count: n+1)
    dp[2] = 1
    dp[3] = 2

    for i in 4...n {
        dp[i] = (i-1) * (dp[i-1] + dp[i-2]) % 1000000000
    }
    print(dp[n])
}