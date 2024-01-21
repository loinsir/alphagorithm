let ve = readLine()!.split(separator: " ").map { Int(String($0))! }
let (v, e) = (ve[0], ve[1])
var graph = [[Int]](repeating: [Int](repeating: Int.max, count: v+1), count: v+1)
for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    graph[a][b] = c
}

for i in 1...v {
    graph[i][i] = 0
}

for k in 1...v {
    for i in 1...v {
        for j in 1...v {
            if graph[i][k] != Int.max && graph[k][j] != Int.max {
                graph[i][j] = min(graph[i][k] + graph[k][j], graph[i][j])
            }
        }
    }
}

var answer = Int.max

for i in 1...v {
    for j in 1...v where i != j {
        if graph[i][j] != Int.max && graph[j][i] != Int.max {
            answer = min(answer, graph[i][j] + graph[j][i])
        }
    }
}

print(answer == Int.max ? -1 : answer)