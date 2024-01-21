let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var graph = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b) = (ab[0], ab[1])
    graph[a][b] = -1
    graph[b][a] = 1
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            if graph[i][j] != 0 { continue }
            if graph[i][k] == graph[k][j] {
                graph[i][j] = graph[i][k]
            }
        }
    }
}

var answer = 0

for i in 1...n {
    var flag = true
    for j in 1...n where j != i {
        if graph[i][j] == 0 {
            flag = false
            break
        }
    }

    if flag {
        answer += 1
    }
}

print(answer)