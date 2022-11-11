let N = Int(readLine()!)!
var arr: [[Int]] = []
for i in 1...N {
    arr.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}

arr.sort(by: { $0[0] < $1[0] })

var arrs: [Int] = []
arrs.append(0)
for x in arr {
    arrs.append(x[1])
}

var dp = Array(repeating: 0, count: N+1)
for i in 1...N {
    for j in 0..<i {
        if arrs[i] > arrs[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}
print(N - dp.max()!)