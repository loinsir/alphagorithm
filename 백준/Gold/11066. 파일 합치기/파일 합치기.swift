let t = Int(readLine()!)!

for _ in 0..<t {
    let k = Int(readLine()!)!
    let sizes = readLine()!.split(separator: " ").map { Int(String($0))! }
    var dp = Array(repeating: Array(repeating: 0, count: k+1), count: k+1)
    var sum = Array(repeating: 0, count: k+1)
    for i in 1...k {
        sum[i] = sum[i-1] + sizes[i-1]
    }
    
    for length in 1..<k {
        for start in 1...k-length {
            let end = start + length
            dp[start][end] = Int.max
            for mid in start..<end {
                dp[start][end] = min(dp[start][end], dp[start][mid] + dp[mid+1][end] + sum[end] - sum[start-1])
            }
        }
    }
    
    
    print(dp[1][k])
}