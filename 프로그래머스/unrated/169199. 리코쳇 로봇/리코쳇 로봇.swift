import Foundation

func solution(_ board:[String]) -> Int {
    var map = [[String]]()
    var robot = [Int]()
    var goal = [Int]()
    for i in 0..<board.count {
        let row = Array(board[i]).map { String($0) }
        map.append(row)
        for j in 0..<row.count {
            if row[j] == "R" {
                robot = [i, j]
            } else if row[j] == "G" {
                goal = [i, j]
            }
        }
    }
    
    var visited = Array(repeating: Array(repeating: false, count: map[0].count), count: map.count)
    visited[robot[0]][robot[1]] = true
    
    var q = [[Int]]()
    var idx = 0
    q.append([robot[0], robot[1], 0])
             
    var answer = 0
    
    func isAvail(_ y: Int, _ x: Int) -> Bool {
        return 0..<map.count ~= y && 0..<map[0].count ~= x
    }
    
    func calNextPos(_ y: Int, _ x: Int, _ dir: Int) -> [Int] {
        var next = [y, x]
        if dir == 0 { // 북
            for i in stride(from: y, through: 0, by: -1) {
                if map[i][x] == "D" || !isAvail(i, x) {
                    break
                } else {
                    next = [i, x]
                }
            }
        } else if dir == 1 { // 동
            for i in stride(from: x, to: map[0].count, by: 1) {
                if map[y][i] == "D" || !isAvail(y, i) {
                    break
                } else {
                    next = [y, i]
                }
            }
        } else if dir == 2 { // 서
            for i in stride(from: x, through: 0, by: -1) {
                if map[y][i] == "D" || !isAvail(y, i) {
                    break
                } else {
                    next = [y, i]
                }
            }
        } else { // 남
            for i in stride(from: y, to: map.count, by: 1) {
                if map[i][x] == "D" || !isAvail(i, x) {
                    break
                } else {
                    next = [i, x]
                }
            }
        }
        
        return next
    }
    
    while idx < q.count {
        let y = q[idx][0], x = q[idx][1], moved = q[idx][2]
        
        if y == goal[0] && x == goal[1] {
            answer = moved
            break
        }
        
        for i in 0..<4 {
            let nextPos = calNextPos(y, x, i)
            let ny = nextPos[0], nx = nextPos[1]
            
            if isAvail(ny, nx) && !visited[ny][nx] {
                visited[ny][nx] = true
                q.append([ny, nx, moved+1])
            }
        }
        idx += 1
    }
    
    return answer != 0 ? answer : -1
}