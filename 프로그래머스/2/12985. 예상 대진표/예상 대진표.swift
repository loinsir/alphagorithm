import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 1
    var a = a, b = b
    
    if a % 2 == 1 { a += 1 }
    if b % 2 == 1 { b += 1 }
    
    while abs(a-b) > 1 {
        a /= 2
        b /= 2
        answer += 1
        if a % 2 == 1 { a += 1 }
        if b % 2 == 1 { b += 1 }
    }
    
    return answer
}