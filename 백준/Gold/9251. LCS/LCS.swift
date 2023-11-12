let first = readLine()!.map { $0 }
let second = readLine()!.map { $0 }

var dp = [[Int]](repeating: [Int](repeating: 0, count: second.count + 1), count: first.count + 1)

for i in 1...first.count {
    for j in 1...second.count {
        if first[i - 1] == second[j - 1] {
            dp[i][j] = dp[i-1][j-1] + 1
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
        }
    }
}

print(dp[first.count][second.count])