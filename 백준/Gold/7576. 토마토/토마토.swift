import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m, n) = (input[0], input[1])
var box = [[Int]]()
var roasted = [[Int]]() // y, x
for i in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    box.append(row)
    
    for j in 0..<m {
        if row[j] == 1 {
            roasted.append([i, j])
        }
    }
}

if roasted.count == 0 {
    print(-1)
} else if roasted.count == m * n {
    print(0)
} else {
    var q = [[Int]]()
    roasted.forEach {
        q.append($0 + [0])
    }
    var idx = 0

    let dy = [1, 0, -1 ,0], dx = [0, 1, 0, -1]
    var answer = 0
    
    while idx < q.count {
        let popped = q[idx]
        let y = popped[0], x = popped[1], time = popped[2]
        answer = time
        for i in 0..<4 {
            let ny = y + dy[i], nx = x + dx[i]
        
            if 0..<n ~= ny && 0..<m ~= nx && box[ny][nx] == 0 {
                q.append([ny, nx, time + 1])
                box[ny][nx] = 1
            }
        }
    
        idx += 1
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if box[i][j] == 0 {
                answer = -1
                break
            }
        }
    }
    print(answer)
}