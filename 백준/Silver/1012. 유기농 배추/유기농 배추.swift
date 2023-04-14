import Foundation 

let t = Int(readLine()!)!

var m = 0, n = 0
var map = [[Bool]]() // Bool 타입이 아닌 Int형으로 선언하면 메모리 초과 오류

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    m = input[0]
    n = input[1]
    let k = input[2]

    map = Array(repeating: Array(repeating: false, count: m), count: n)

    for _ in 0..<k {
        let pos = readLine()!.split(separator: " ").map { Int(String($0))! }
        map[pos[1]][pos[0]] = true
    }

    var answer = 0
    for y in 0..<n {
        for x in 0..<m {
            if map[y][x] {
                dfs(y, x)
                answer += 1
            }
        }
    }

    print(answer)
}

func dfs(_ y: Int, _ x: Int) {
    if map[y][x] { 
        map[y][x] = false

        for i in 0..<4 {
            let nextY = y + dy[i], nextX = x + dx[i]

            if nextY >= 0 && nextY < n && nextX >= 0 && nextX < m {
                if map[nextY][nextX] {
                    dfs(nextY, nextX)
                }
            }
        }
    }
}