import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M, P) = (input[0], input[1], input[2])

let s = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }

var map = Array(repeating: Array(repeating: 0, count: M), count: N)
var visited = Array(repeating: Array(repeating: 0, count: M), count: N)
var answer = Array(repeating: 0, count: P+1)
var q = Array(repeating: [[Int]](), count: P+1) // 각 플레이어 별 큐!

// 1. 입력으로 들어오는 초기 지도 모습을 적절하게 변환
for i in 0..<N {
    let row = readLine()!.map { String($0) }
    for j in 0..<M {
        if row[j] == "#" {
            visited[i][j] = 1
            map[i][j] = -1
        } else if row[j] == "." {
            map[i][j] = 0
        } else {
            let number = Int(row[j])!
            map[i][j] = number
            q[number].append([i, j])
            visited[i][j] = 1
            answer[number] += 1
        }
    }
}

let dx = [1, 0, -1, 0]
let dy = [0, -1, 0, 1]

// 2. number가 각 플레이어로, 각 플레이어 자신의 큐가 비어야만 종료, 그렇지 않으면 플레이어 자신의 s 만큼 반복
func bfs(number: Int) {
    for _ in 0..<s[number] {
        if q[number].isEmpty { return }

        var dq = Array(q[number].reversed())
        q[number].removeAll()

        for _ in 0..<dq.count {
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]

            for i in 0..<4 {
                let nextX = x + dx[i], nextY = y + dy[i]

                if nextX < 0 || nextX >= N || nextY < 0 || nextY >= M || map[nextX][nextY] < 0 { continue }

                if visited[nextX][nextY] == 0 && map[nextX][nextY] == 0 {
                    answer[number] += 1
                    visited[nextX][nextY] = 1
                    map[nextX][nextY] = number
                    q[number].append([nextX, nextY])
                }
            }
        }
    }
}
// 맵이 꽉찰 때까지 반복
while true {
    var count = 0
    for number in 1...P {
        if !q[number].isEmpty {
            bfs(number: number)
        }
        count += q[number].count
    }
    if count == 0 { break }
}

for i in 1...P {
    print(answer[i], terminator: " ")
}