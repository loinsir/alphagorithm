import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r, c) = (input[0], input[1])

let dy = [1, 0, -1, 0], dx = [0, 1, 0, -1]

var pos = [0, 0]
var fires = [[Int]]() // y, x
var map = [[String]]()

for i in 0..<r {
    let input = Array(readLine()!).map { String($0) }
    for j in 0..<c {
        if input[j] == "F" {
            fires.append([i, j])
        } else if input[j] == "J" {
            pos = [i, j]
        }
    }
    map.append(input)
}

var q = [[Int]]() // mark, y, x, time
for i in 0..<fires.count {
    q.append([0] + fires[i] + [0])
}
q.append([1] + pos + [0])
var idx = 0

var answer = -1

while idx < q.count {
    let popped = q[idx]

    let mark = popped[0] ,y = popped[1], x = popped[2], time = popped[3]
    if (y == 0 || x == 0 || y == r-1 || x == c-1) && mark == 1 {
        answer = time+1
        break
    }
    
    for i in 0..<4 {
        let ny = y + dy[i], nx = x + dx[i]
            
        if 0..<r ~= ny && 0..<c ~= nx {
            if map[ny][nx] != "#" {
               if mark == 0 && map[ny][nx] != "F" || mark == 1 && map[ny][nx] == "." {
                   q.append([mark, ny, nx, time + 1])
                   map[ny][nx] = mark == 0 ? "F" : "J"
               }
            } 
        }
    }
    idx += 1
}
print(answer == -1 ? "IMPOSSIBLE" : answer)