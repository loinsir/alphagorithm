import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (input[0], input[1])

var coins = [Int]()
for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}

var dp = Array(repeating: 999999, count: k+1) // 해당 가격을 얻을 수 있는 최소 동전 수
dp[0] = 0
for i in 0..<coins.count {
    if coins[i] <= k {
        dp[coins[i]] = 1
    }
}

for p in 1...k {
    for c in 0..<n {
        if p > coins[c] && dp[p-coins[c]] > 0 {
            dp[p] = min(dp[p], dp[p-coins[c]] + 1)
        }
    }
}
if dp[k] >= 999999 {
    dp[k] = -1
}
print(dp[k])