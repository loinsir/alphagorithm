import Foundation

let n = Int(readLine()!)!

var dp = Array(repeating: 0, count: 100)
var tp = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    tp.append(input)
}

for i in 0..<n {
    if dp[i] > dp[i+1] {
        dp[i+1] = dp[i]
    }
    
    if dp[i+tp[i][0]] < dp[i] + tp[i][1] {
        dp[i+tp[i][0]] = dp[i] + tp[i][1]
    }
}

print(dp[n])