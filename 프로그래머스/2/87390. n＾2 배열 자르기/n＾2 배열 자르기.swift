import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    
    var answer = [Int]()
    
    var row = [Int]()
    var currentY = -1
    
    for num in left...right {
        let posY = Int(num / Int64(n))
        let posX = Int(num % Int64(n))
        
        if currentY != posY {
            row = [Int]()
            (0...posY).forEach { _ in row.append(posY + 1) }
            while row.count < n {
                row.append(row[row.count - 1] + 1)
            }
            currentY = posY
        }

        answer.append(row[posX])
    }
    
    return answer
}