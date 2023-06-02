import Foundation

let asciiA = UnicodeScalar("A").value
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r, c) = (input[0], input[1])
var map = [[Int]]()
var visited = [Bool](repeating: false, count: 26)

for _ in 0..<r {
    map.append(readLine()!.map { Int(UnicodeScalar(String($0))!.value - asciiA) })
}

var maximum = 0
for i in map {
    for j in i {
        if !visited[j] {
            visited[j] = true
            maximum += 1
        }
    }
}

var answer = 0

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

func backtracking(_ y: Int, _ x: Int, _ d: Int, _ bitmask: Int) {
    if answer < d {
        answer = d
        if answer >= maximum {
            return
        }
    }

    for k in 0..<4 {
        let ny = y + dy[k]
        let nx = x + dx[k]

        if 0..<r ~= ny && 0..<c ~= nx {
            let nb = 1 << map[ny][nx]
            if bitmask & nb == 0 {
                backtracking(ny, nx, d + 1, bitmask | nb)
                if answer >= maximum {
                    return
                }
            }
        }
    }
}

backtracking(0, 0, 1, 1 << map[0][0])
print(answer)