import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var count: Int64 = 0
    var left: Int64 = 1, right: Int64 = Int64(times.max()! * n)
    
    while left <= right {
        var mid: Int64 = (left + right) / 2
        var people: Int64 = 0
        for time in times {
            people += mid / Int64(time)
            if people >= n {
                break
            }
        }
        
        if people >= n {
            count = mid
            right = mid - 1
        } else if people < n {
            left = mid + 1
        }
    }
    
    
    return count
}