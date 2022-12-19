let N = Int(readLine()!)!
let pair = Int(readLine()!)!

var graph = [[Int]](repeating: [], count: N+1)
var visits = Array(repeating: false, count: N+1)
for _ in 1...pair {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}
var result = 0
func dfs(_ node: Int) {
    for i in graph[node] {
        if visits[i] == false {
            visits[i] = true
            result += 1
            dfs(i)
        }
    }
}
visits[1] = true
dfs(1)
print(result)