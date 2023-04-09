import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

let dydx = [[1, 0], [0, -1], [-1, 0], [0, 1]]
var map = Array(repeating: Array(repeating: [[Int]](), count: N+1), count: N+1)
var isLight = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
var visited = Array(repeating: Array(repeating: 0 , count: N+1), count: N+1)

for _ in 0..<M {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (x, y, a, b) = (info[0], info[1], info[2], info[3])
    
    map[x][y].append([a, b])
}

var answer = 1
isLight[1][1] = 1
visited[1][1] = 1

func bfs() {
    var q = [[1, 1]]
    var idx = 0

    while q.count > idx {
        
        let x = q[idx][0], y = q[idx][1]

        for room in map[x][y] {
            if isLight[room[0]][room[1]] == 0 {
                isLight[room[0]][room[1]] = 1
                answer += 1

                for d in dydx {
                    let nextX = d[0] + room[0], nextY = d[1] + room[1] 
                    if nextX > 0 && nextX <= N && nextY > 0 && nextY <= N && visited[nextX][nextY] == 1 {
                        visited[room[0]][room[1]] = 1
                        q.append([room[0], room[1]])
                    }
                }
            }
        }

        for d in dydx {
            let nextX = d[0] + x, nextY = d[1] + y 
            if nextX > 0 && nextX <= N && nextY > 0 && nextY <= N && visited[nextX][nextY] == 0 && isLight[nextX][nextY] == 1 {
                visited[nextX][nextY] = 1
                q.append([nextX, nextY])
            }
        }

        idx += 1
    }

}
bfs()
print(answer)