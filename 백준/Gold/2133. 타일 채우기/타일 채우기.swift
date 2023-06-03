import Foundation

let N = Int(readLine()!)!
var dp = [Int](repeating: 0, count: N+1)
if N > 2 && N % 2 == 0 {
    dp[2] = 3
    for i in 4...N {
        dp[i] = 3 * dp[i-2]

        for j in stride(from: i-4, through: 0, by: -2) {
            dp[i] += 2 * dp[j]
        }
        dp[i] += 2
    }
    print(dp[N])
} else if N == 2 {
    print(3)
} else {
    print(0)
}