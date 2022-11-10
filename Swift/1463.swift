func solution() -> Int{
    let n = Int(readLine()!)!
    if n == 1 {
        return 0
    } else if n == 2 {
        return 1
    } else if n == 3 {
        return 1
    } else {
        var dp: [Int] = [Int](repeating: 0, count: n+1)
        dp[1] = 0
        dp[2] = 1
        dp[3] = 1
        
        for i in 4...n {
            dp[i] = dp[i-1] + 1
            if i % 3 == 0 { 
                dp[i] = min(dp[i], dp[i/3] + 1)
            } // else if로 하면 안된다. 2, 3으로 둘다 나눠질 수 있기 때문이다.
            if i % 2 == 0{
                dp[i] = min(dp[i], dp[i/2] + 1)
            }
        }
        return dp[n]
    }
}

print(solution())