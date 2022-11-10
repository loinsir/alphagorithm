let n = Int(readLine()!)! //수의 길이
var dp = Array(repeating: Array(repeating: 0, count: 10), count: 101)
var sum = 0

for i in 1...9 {
    dp[1][i] = 1
}

dp[2][0] = 1
dp[2][1] = 1
dp[2][2] = 2
dp[2][3] = 2
dp[2][4] = 2
dp[2][5] = 2
dp[2][6] = 2
dp[2][7] = 2
dp[2][8] = 2
dp[2][9] = 1

for i in stride(from: 3, through: n, by: 1) {
    for j in 0...9 {
        if j == 0 {
            dp[i][j] = dp[i - 1][j + 1] % 1000000000
        }else if j == 9{
            dp[i][j] = dp[i - 1][j - 1] % 1000000000
        }else {
            dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j + 1]) % 1000000000
        }
    }
}

for i in 0...9 {
    sum += dp[n][i]
}

print("\(sum % 1000000000)")