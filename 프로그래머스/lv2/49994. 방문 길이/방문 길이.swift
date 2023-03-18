import Foundation

func solution(_ dirs:String) -> Int {
    
    var currentX = 0
    var currentY = 0
    var visited = Set<[Int]>()
    
    var dirs = Array(dirs).map { String($0) }
    
    for dir in dirs {
        var (dx, dy) = (0, 0)
        
        if dir == "U" {
            (dx, dy) = (0, 1)
        } else if dir == "D" {
            (dx, dy) = (0, -1)
        } else if dir == "R" {
            (dx, dy) = (1, 0)
        } else if dir == "L" {
            (dx, dy) = (-1, 0)
        }
        
        let nextX = currentX + dx
        let nextY = currentY + dy
        
        if abs(nextX) > 5 || abs(nextY) > 5 {
            continue
        }
        
        if !visited.contains([currentX, currentY, nextX, nextY]) && !visited.contains([nextX, nextY, currentX, currentY]) {
            visited.insert([currentX, currentY, nextX, nextY])
        }
        
        currentX = nextX
        currentY = nextY
    }
    return visited.count
}