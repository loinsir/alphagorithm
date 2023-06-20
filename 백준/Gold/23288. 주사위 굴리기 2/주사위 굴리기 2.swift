import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, k) = (input[0], input[1], input[2])

var dice = [1, 2, 3, 4, 5, 6]
var map = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(row)
}

let dy = [1, 0, -1, 0], dx = [0, 1, 0, -1]
var dir = 1
var pos = [0, 0]
var score = 0

for _ in 0..<k {

    var ny = dy[dir] + pos[0], nx = dx[dir] + pos[1]
    if !(0..<n ~= ny) {
        ny = pos[0] + dy[(dir + 2) % 4]
        dir = (dir + 2) % 4
    } else if !(0..<m ~= nx) {
        nx = pos[1] + dx[(dir + 2) % 4]
        dir = (dir + 2) % 4
    }

    pos = [ny, nx]

    switch dir {
        case 0: dice = [dice[1], dice[5], dice[2], dice[3], dice[0], dice[4]]
        case 1: dice = [dice[3], dice[1], dice[0], dice[5], dice[4], dice[2]]
        case 2: dice = [dice[4], dice[0], dice[2], dice[3], dice[5], dice[1]]
        default: dice = [dice[2], dice[1], dice[5], dice[0], dice[4], dice[3]]
    }

    let b = map[ny][nx]

    var q = [[Int]]()
    var idx = 0
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    q.append([ny, nx])
    visited[ny][nx] = true
    while idx < q.count {
        let popped = q[idx]

        let y = popped[0], x = popped[1]
        for i in 0..<4 {
            let nny = y + dy[i], nnx = x + dx[i]

            if 0..<n ~= nny && 0..<m ~= nnx && !visited[nny][nnx] && map[nny][nnx] == b {
                visited[nny][nnx] = true
                q.append([nny, nnx])
            }
        }
        idx += 1
    }

    score += b * q.count

    if dice[5] < b {
        dir = (dir + 1) % 4
    } else if dice[5] > b {
        dir -= 1
        if dir < 0 {
            dir += 4
        }
    }
}

print(score)