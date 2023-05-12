import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var graph = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
var visited = Array(repeating: false, count: n+1)
for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (uv[0], uv[1])
    graph[u][v] = 1
    graph[v][u] = 1
}
var answer = 0

func dfs(_ p: Int) {
    for i in 1...n {
        if graph[p][i] == 1 {
            if !visited[i] {
                visited[i] = true
                dfs(i)
            }
        }
    }
}

for i in 1...n {
    if visited[i] == false {
        answer += 1
        visited[i] = true
        dfs(i)
    }
}

print(answer)