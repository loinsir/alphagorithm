import Foundation

func solution(_ s:String) -> Bool
{
    var s = Array(s.lowercased())
    var ans:Bool = false
    var pCount = 0, yCount = 0
    
    for c in s {
        if c == "p" {
            pCount += 1
        } else if c == "y" {
            yCount += 1
        }
    }

    return pCount == yCount
}