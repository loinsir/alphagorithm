import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0
    var a = A.sorted(), b = B.sorted()
    
    for i in 0..<a.count {
        ans += a[i] * b[a.count - i - 1]
    }

    return ans
}