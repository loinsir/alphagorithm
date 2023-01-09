import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer: Int64 = 0
    var w = Int64(w)
    var h = Int64(h)
    answer = (w * h - (w+h-gcd(w, h)))
    
    return answer
}

func gcd(_ a: Int64, _ b: Int64) -> Int64 {
    return b == 0 ? a : gcd(b, a % b)
}