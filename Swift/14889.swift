import Foundation

let N = Int(readLine()!)!
var table = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)
var result: [Int] = []
var resultMin = Int.max

var startTeam = 0
var linkTeam = 0

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    table[i].append(contentsOf: input)
}

func dfs(_ depth: Int, _ start: Int) {
    if depth == N / 2 {
        startTeam = 0
        linkTeam = 0
        for i in 0..<N {
            for j in 0..<N {
                if !visited[i] && !visited[j] {
                    linkTeam += table[i][j]
                }
                if visited[i] && visited[j] {
                    startTeam += table[i][j]
                }
            }
        }
        resultMin = min(resultMin, abs(startTeam - linkTeam))
        return
    }
    for i in start..<N {
        if !visited[i] {
            visited[i] = true
            dfs(depth+1, i)
            visited[i] = false
        }
    }
}
dfs(0, 0)
print(resultMin)