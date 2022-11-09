let n = Int(readLine()!)!

var arr = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
var dp = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    var j = 1
    for a in input {
        arr[i][j] = a
        j += 1
    }
}

for i in 1...n {
    for j in 1...n {
        dp[i][j] = max(dp[i-1][j], dp[i-1][j-1]) + arr[i][j]
    }
}

print(dp[n].max()!)
