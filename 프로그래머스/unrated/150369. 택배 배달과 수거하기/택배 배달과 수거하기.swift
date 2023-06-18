import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var deliveries = Array(deliveries.reversed())
    var pickups = Array(pickups.reversed())
    var answer: Int64 = 0
    
    var delCap = 0
    var pickCap = 0
    
    for i in 0..<n {
        delCap += deliveries[i]
        pickCap += pickups[i]
        
        while delCap > 0 || pickCap > 0 {
            delCap -= cap
            pickCap -= cap
            answer += Int64(n - i) * 2
        }
    }
    
    return answer
}