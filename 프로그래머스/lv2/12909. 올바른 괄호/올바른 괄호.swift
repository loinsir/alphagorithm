import Foundation

func solution(_ s:String) -> Bool
{
    var count: Int64 = 0
    
    for char in s {
        if count == 0 && char == "(" {
            count += 1
        } else {
            
            if char == "(" {
                count += 1
            } else if count > 0 && char == ")" {
                count -= 1
            } else {
                return false
            }
        }
    }
    
    return count == 0
    
}