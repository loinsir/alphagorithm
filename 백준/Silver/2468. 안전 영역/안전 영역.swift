import Foundation

let N = Int(readLine()!)!
var board = [[Int]]()
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(input)
}

var result = [0]
var visited = Array(repeating: Array(repeating: 0, count: N), count: N)

func dfs(_ x: Int, _ y: Int, _ height: Int) {
    let dx = [0, 0, -1, 1]
    let dy = [1, -1, 0, 0]

    for i in 0..<dx.count {
        let nextX = x + dx[i]
        let nextY = y + dy[i]

        if nextX < 0 || nextY < 0 || nextX >= N || nextY >= N {
            continue
        }

        if board[nextX][nextY] > height && visited[nextX][nextY] == 0 {
            visited[nextX][nextY] = 1
            dfs(nextX, nextY, height)
        }
    }
}

for height in 0...100 {
    var count = 0

    for x in 0..<N {
        for y in 0..<N {
            if board[x][y] > height && visited[x][y] == 0 {
                visited[x][y] = 1
                count += 1
                dfs(x, y, height)
            }
        }
    }

    result.append(count)
    visited = Array(repeating: Array(repeating: 0, count: N), count: N)
    count = 0
}
print(result.max()!)