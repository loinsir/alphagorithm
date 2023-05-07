import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
arr.insert(0, at:0)

var dp = Array(repeating: 0, count: n+1)

if n < 2 {
    print(0)
} else {
    for i in 2...n {
        var tmp = 0
        for j in 1...i-1 {
            tmp = max(tmp, dp[j-1] + arr[j...i].max()! - arr[j...i].min()!)
        }
        dp[i] = tmp
    }

    print(dp.last!)
}