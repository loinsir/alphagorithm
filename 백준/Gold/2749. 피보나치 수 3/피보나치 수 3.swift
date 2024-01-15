let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 15 * 100000)

if n == 0 {
    print(0)
} else if n == 1 {
    print(1)
} else {
    dp[0] = 0
    dp[1] = 1
    for i in 2..<15 * 100000 {
        dp[i] = (dp[i-1] + dp[i-2]) % 1000000
    }
    print(dp[n % (15 * 100000)])
}
