let T = Int(readLine()!)!

var dp: [Int] = Array(repeating: 0, count: 45)
dp[1] = 1
dp[2] = 2

for i in 3...44 {
    dp[i] = dp[i-1] + dp[i-2] + 1
}

for _ in 0..<T {
    let input = Int(readLine()!)!
    for i in 1...44 {
        if dp[i] > input {
            print(i-1)
            break
        }
    }
}