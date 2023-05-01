import Foundation

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var start = (0, 0)
var exit = (0, 0)
var lever = (0, 0)

func solution(_ maps:[String]) -> Int {
    var board = [[String]]()
    
    for i in 0..<maps.count {
        let row = Array(maps[i]).map { String($0) }
        board.append(row)
        
        for j in 0..<row.count {
            if row[j] == "S" {
                start = (i, j)
            } else if row[j] == "E" {
                exit = (i, j)
            } else if row[j] == "L" {
                lever = (i, j)
            }
        }
    }
    
    func bfs(_ start: (Int, Int), _ end: String) -> Int? {
        var q = [[Int]]()
        q.append([start.0, start.1, 0])
        var idx = 0
        var distance: [[Int]] = Array(repeating: Array(repeating: -1, count: maps[0].count), count: maps.count)
        distance[start.0][start.1] = 0

        while idx < q.count {
            let (x, y) = (q[idx][0], q[idx][1])

            for i in 0..<4 {
                let nx = x + dx[i], ny = y + dy[i]
                if isValid(nx, ny) && board[nx][ny] != "X" && distance[nx][ny] == -1 {
                    if board[nx][ny] == end {
                        return distance[x][y] + 1
                    }
                    distance[nx][ny] = distance[x][y] + 1
                    q.append([nx, ny])
                }
            }
            idx += 1
        }
        return nil
    }
    
    
    func isValid(_ x: Int, _ y: Int) -> Bool {
        return x >= 0 && x < maps.count && y >= 0 && y < maps[0].count
    }
    
    guard let time1 = bfs(start, "L") else { return -1 }
    guard let time2 = bfs(lever, "E") else { return -1 }
    
    return time1 + time2
}