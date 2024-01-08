import Foundation

func solution(_ n:Int, _ tops:[Int]) -> Int {
    var a = [Int](repeating: 0, count: n + 1)
    var b = [Int](repeating: 0, count: n + 1)
    b[0] = 1
    
    for i in 0..<n {
        a[i + 1] = (a[i] + b[i]) % 10007
        
        if tops[i] == 1 {
            b[i + 1] = (2 * a[i] + 3 * b[i]) % 10007
        } else {
            b[i + 1] = (a[i] + 2 * b[i]) % 10007
        }
    }
    
    return (a[n] + b[n]) % 10007
}