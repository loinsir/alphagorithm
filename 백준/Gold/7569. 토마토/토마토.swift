import Foundation

let info = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m, n, h) = (info[0], info[1], info[2])

var box = [[[Int]]]()
var roasted = [[Int]]() // [h, y, x]

for i in 0..<h {
    var map = [[Int]]()
    for j in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        for k in 0..<m {
            if row[k] == 1 {
                roasted.append([i, j, k])
            }
        }
        map.append(row)
    }
    box.append(map)
}

// 상 하 전 후 좌 우
let dh = [-1, 1, 0, 0, 0, 0], dx = [0, 0, 0, 0, -1, 1], dy = [0, 0, -1, 1, 0, 0]

func bfs() -> Int {
    var answer = 0
    
    if roasted.count == m * n * h { // 이미 다 익은 경우
        return 0
    } else if roasted.count == 0 { // 하나라도 익은게 없는 경우
        return -1
    }
    
    var q = [[Int]]() // [h, y, x, time]
    var idx = 0
    for i in 0..<roasted.count {
        let apple = roasted[i]
        q.append(apple + [0])
    }
    
    while idx < q.count {
        let apple = q[idx]

        let ch = apple[0], cy = apple[1], cx = apple[2], time = apple[3]
        
        var flag = false
        for i in 0..<h {
            for j in 0..<n {
                for k in 0..<m {
                    if box[i][j][k] == 0 { // 모두 익지는 못한 경우
                        flag = true
                        break
                    }
                }
                if flag {
                    break
                }
            }
            if flag {
                break
            }
        }
        if !flag {
            answer = max(answer, time)
        }

        for i in 0..<6 {
            let nh = ch + dh[i], ny = cy + dy[i], nx = cx + dx[i]
            
            if 0..<h ~= nh && 0..<n ~= ny && 0..<m ~= nx && box[nh][ny][nx] == 0 {
                q.append([nh, ny, nx, time + 1])
                box[nh][ny][nx] = 1
            }
        }
        
        idx += 1
    }
    
    
    
    for i in 0..<h {
        for j in 0..<n {
            for k in 0..<m {
                if box[i][j][k] == 0 { // 모두 익지는 못한 경우
                    return -1
                }
            }
        }
    }
    
    return answer
}

print(bfs())
