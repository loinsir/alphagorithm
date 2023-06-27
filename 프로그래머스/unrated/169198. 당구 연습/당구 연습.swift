import Foundation

func solution(_ m:Int, _ n:Int, _ startX:Int, _ startY:Int, _ balls:[[Int]]) -> [Int] {
    var answer = [Int]()
    
    for ball in balls {
        var tmp = Int.max
        
        if ball[0] != startX || ball[1] > startY {
            tmp = min(tmp, Int(pow(Float(abs(startX - ball[0])), 2.0)) + Int(pow(Float(abs(startY + ball[1])), 2.0)))
        }
        
        if startY != ball[1] || ball[0] > startX {
            tmp = min(tmp, Int(pow(Float(abs(startX + ball[0])), 2.0)) + Int(pow(Float(abs(startY - ball[1])), 2.0)))
        }
        
        if startX != ball[0] || ball[1] < startY {
            tmp = min(tmp, Int(pow(Float(abs(startX - ball[0])), 2.0)) + Int(pow(Float(abs(2 * n - ball[1] - startY)), 2.0)))
        }
        
        if startY != ball[1] || ball[0] < startX {
            tmp = min(tmp, Int(pow(Float(abs(2 * m - ball[0] - startX)), 2.0)) + Int(pow(Float(abs(startY - ball[1])), 2.0)))
        }
        answer.append(tmp)
    }
    
    return answer
}