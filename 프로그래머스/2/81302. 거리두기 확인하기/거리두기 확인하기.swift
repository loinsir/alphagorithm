import Foundation

var answer = [Int]()
var map = [[String]]()
var person = [[Int]]()

func solution(_ places:[[String]]) -> [Int] {
    
    for place in places {
        map.removeAll()
        person.removeAll()
        
        for i in 0..<5 {
            let row = Array(place[i]).map { String($0) }
            map.append(row)
            
            for j in 0..<5 {
                if row[j] == "P" {
                    person.append([i, j])
                }
            }
        }
        
        check()
    }
    
    return answer
}

let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

func check() {
    for pos in person {
        let y = pos[0], x = pos[1]
        
        var q = [[Int]]()
        var idx = 0
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)
        q.append([y, x, 0, 0]) // y, x , distance, partition
        
        while idx < q.count {
            let popped = q[idx], cy = popped[0], cx = popped[1], dist = popped[2], partition = popped[3]
            visited[cy][cx] = true

            if dist > 0 && map[cy][cx] == "P" && partition == 0 {
                answer.append(0)
                return
            }
            
            for i in 0..<4 {
                let ny = cy + dy[i], nx = cx + dx[i], nd = dist + 1
                guard 0..<5 ~= ny && 0..<5 ~= nx && nd <= 2 && !visited[ny][nx] else { continue }
                
                if map[cy][cx] == "X" {
                    q.append([ny, nx, nd, 1])
                } else {
                    q.append([ny, nx, nd, partition])
                }
            }
            
            idx += 1
        }
    }
    answer.append(1)
}