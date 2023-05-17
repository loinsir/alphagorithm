import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

let marr = readLine()!.split(separator: " ").map { Int(String($0))! }
let carr = readLine()!.split(separator: " ").map { Int(String($0))! }

let maxCost = carr.reduce(0, +)

var dp = [Int](repeating: 0, count: maxCost+1)

for i in 0..<n {
    for c in (carr[i]...maxCost).reversed() {
        dp[c] = max(dp[c], dp[c - carr[i]] + marr[i])
    }
}

for c in 0...maxCost {
    if dp[c] >= m {
        print(c)
        break
    }
}