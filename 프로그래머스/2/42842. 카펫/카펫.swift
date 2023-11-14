import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    var answer = [Int]()
    let wholeCount = brown + yellow
    
    for w in 3...brown {
        let h = wholeCount / w
        
        if w >= h && 2 * w + 2 * h - 4 == brown {
            return [w, h]
        }
    }
    
    return answer
}