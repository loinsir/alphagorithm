import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r, c, t) = (input[0], input[1], input[2])

var map = [[Int]]()
var air = [0, 0]
for i in 0..<r {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 0..<c {
        if row[j] == -1 && air == [0, 0] {
            air = [i, j]
        }
    }
    map.append(row)
}

let dy = [1, 0, -1, 0], dx = [0, 1, 0, -1]

for _ in 0..<t {

    var flowMap = Array(repeating: Array(repeating: 0, count: c), count: r)
    // 확산
    for y in 0..<r {
        for x in 0..<c {
            if map[y][x] > 0 {
                var count = 0
                let flow = map[y][x] / 5
                for i in 0..<4 {
                    let ny = y + dy[i], nx = x + dx[i]
                    if 0..<r ~= ny && 0..<c ~= nx && map[ny][nx] != -1 {
                        count += 1
                        flowMap[ny][nx] += flow
                    }
                }
                map[y][x] -= flow * count
            }
        }
    }

    for y in 0..<r {
        for x in 0..<c {
            map[y][x] += flowMap[y][x]
        }
    }
    
    // 공기청정기
    var tmp = 0
    for x in 1...c-1 {
        let tmpVal = map[air[0]][x]
        map[air[0]][x] = tmp
        tmp = tmpVal
    }
    
    for y in stride(from: air[0] - 1, through: 0, by: -1) {
        let tmpVal = map[y][c - 1]
        map[y][c - 1] = tmp
        tmp = tmpVal
    }
    
    for x in stride(from: c - 2, through: 0, by: -1) {
        let tmpVal = map[0][x]
        map[0][x] = tmp
        tmp = tmpVal
    }
    
    for y in 1...(air[0] - 1) {
        let tmpVal = map[y][0]
        map[y][0] = tmp
        tmp = tmpVal
    }
    tmp = 0

    for x in 1...c-1 {
        let tmpVal = map[air[0] + 1][x]
        map[air[0] + 1][x] = tmp
        tmp = tmpVal
    }

    for y in (air[0] + 2)...(r-1) {
        let tmpVal = map[y][c - 1]
        map[y][c - 1] = tmp
        tmp = tmpVal
    }

    for x in stride(from: c - 2, through: 0, by: -1) {
        let tmpVal = map[r - 1][x]
        map[r - 1][x] = tmp
        tmp = tmpVal
    }
    
    for y in stride(from: r - 2, through: air[0] + 2, by: -1) {
        let tmpVal = map[y][0]
        map[y][0] = tmp
        tmp = tmpVal
    }
}

var answer = 0
for y in 0..<r {
    for x in 0..<c {
        if map[y][x] > 0 {
            answer += map[y][x]
        }
    }
}

print(answer)