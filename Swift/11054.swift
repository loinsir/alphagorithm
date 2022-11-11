let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
arr.insert(0, at: 0)
arr.append(0)

var dp = Array(repeating: 0, count: N+1)
var reverse_dp = Array(repeating: 0, count: N+1)

for i in 1..<N+1 {
    for j in 0..<i {
        if arr[i] > arr[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

for i in stride(from: N, through: 1, by: -1) {
    for j in stride(from: N+1, to: i, by: -1) {
        if arr[i] > arr[j] {
            reverse_dp[i-1] = max(reverse_dp[i-1], reverse_dp[j-1] + 1)
        }
    }
}

var result = 0
for i in 0...N-1 {
    result = max(result, reverse_dp[i] + dp[i+1])
}
print(result-1) // 이부분 때문에 틀렸다...