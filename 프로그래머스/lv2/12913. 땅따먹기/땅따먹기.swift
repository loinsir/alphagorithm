import Foundation

func solution(_ land:[[Int]]) -> Int{
    var answer = 0
    var dp = land
    
    if land.count == 1 {
        return land.last!.max()!
    } else {
        for i in 1..<land.count {
            for j in 0..<4 {
                
                var prevMax = 0
                for idx in 0..<4 {
                    if idx == j {
                        continue
                    }
                    prevMax = max(prevMax, dp[i-1][idx])
                }
                
                dp[i][j] += prevMax
            }
        }
        
        return dp.last!.max()!
    }
    
}