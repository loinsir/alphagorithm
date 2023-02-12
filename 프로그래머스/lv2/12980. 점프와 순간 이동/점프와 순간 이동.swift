import Foundation

func solution(_ n:Int) -> Int 
{
    var ans = 0
    var current = n
    
    while current > 0 {
        if current % 2 == 0 {
            current /= 2
        } else {
            current -= 1
            ans += 1
        }
    }

    return ans
}