import Foundation

var input = readLine()!.split(separator: " ")
let n = Int(input[0])!
let k = Int(input[1])!

var coins = [Int]()
for _ in 1...n {
    let coin = Int(readLine()!)!
    coins.append(coin)
}

var dp = [Int](repeating: 0, count: k+1)
dp[0] = 1

for coin in coins {
    for j in 1...k {
        if coin <= j {
            dp[j] += dp[j-coin]
            if dp[j] > Int(pow(2.0, 31.0)) {
                dp[j] = 0
            }
        }
    }
}

print(dp[k])