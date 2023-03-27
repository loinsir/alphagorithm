import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var stones = stones
    
    var left = 0
    var right = stones.max()!
    
    while left <= right {
        var targetNum = (left + right) / 2
        
        var tempSum = 0
        var flag = false
        
        for i in 0..<stones.count {
            if stones[i] <= targetNum {
                tempSum += 1
            } else {
                tempSum = 0
            }
            
            if tempSum >= k {
                flag = true
                break
            }
        }
        
        if flag {
            right = targetNum - 1
        } else {
            left = targetNum + 1
        }
    }
    
    return left
}