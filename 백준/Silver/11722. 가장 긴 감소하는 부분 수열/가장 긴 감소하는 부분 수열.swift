let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! } + [0]
arr.reverse()
var dp = [Int](repeating: 0, count: n + 1)

for i in 1...n {
    for j in 0..<i {
        if arr[j] < arr[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)
