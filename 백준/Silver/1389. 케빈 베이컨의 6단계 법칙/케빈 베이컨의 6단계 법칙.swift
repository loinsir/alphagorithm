import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var graph = Array(repeating: Array(repeating: 10000000, count: n+1), count: n+1)

for _ in 0..<m {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b) = (row[0], row[1])
    graph[a][b] = 1
    graph[b][a] = 1
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

var bacon = 10000000
var answer = 0
for i in 1...n {
    var tmp = 0
    for j in 1...n {
        tmp += graph[i][j]
    }
    
    if bacon > tmp {
        answer = i
        bacon = tmp
    } 
}

print(answer)