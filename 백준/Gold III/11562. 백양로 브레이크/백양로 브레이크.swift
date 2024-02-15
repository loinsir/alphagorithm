import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
let inf = Int.max
var graph = [[Int]](repeating: [Int](repeating: 100000000, count: n+1), count: n+1)

for _ in 0..<m {
    let uvb = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v, b) = (uvb[0], uvb[1], uvb[2])

    if b == 0 {
        graph[u][v] = 0
        graph[v][u] = 1
    } else {
        graph[u][v] = 0
        graph[v][u] = 0
    }
}

for i in 1...n {
    graph[i][i] = 0
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            graph[i][j] = min(graph[i][k] + graph[k][j], graph[i][j])
        }
    }
}

let k = Int(readLine()!)!

for _ in 0..<k {
    let se = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (s, e) = (se[0], se[1])

    print(graph[s][e])
}