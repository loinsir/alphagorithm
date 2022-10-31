let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let N = input[0], M = input[1], R = input[2]

var graph: [Int: [Int]] = [:]

for i in 1...N {
    graph[i] = []
}

for _ in 0..<M { // 그래프 만들기
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let u = input[0], v = input[1]
    graph[u]!.append(v)
    graph[v]!.append(u)
}

var result: [Int: Int] = [:]
for i in 1...N {
    result[i]=0
}
var count = 0

var visited: [Bool] = Array(repeating: false, count: N+1)
func dfs(_ graph: [Int: [Int]], _ start: Int) {
    visited[start] = true
    count+=1
    result[start] = count

    for x in graph[start]!.sorted(by: < ) {
        if visited[x] == false {
            dfs(graph, x)
        }
    }
}

dfs(graph, R)
for i in 1...N {
    print(result[i]!)
}