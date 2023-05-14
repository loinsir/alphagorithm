import Foundation

let T = Int(readLine()!)!
var graph = [[Int]]()
var parent = [Int]()
var depth = [Int]()

for _ in 0..<T {
    
    let N = Int(readLine()!)! // 트리 구성 수
    parent = Array(repeating: 0, count: N+1)
    depth = Array(repeating: 0, count: N+1)
    graph = Array(repeating: [Int](), count: N+1)

    setTree(1, 0)
    
    for _ in 0..<N-1 {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (a, b) = (input[0], input[1])
        
        graph[a].append(b)
        setTree(b, a)
    }
    
    let find = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b) = (find[0], find[1])
    print(findParent(a, b))
}

func setTree(_ node: Int, _ parentNode: Int) { // dfs 트리 구성
    parent[node] = parentNode
    depth[node] = depth[parentNode] + 1

    for i in 0..<graph[node].count {
        let child = graph[node][i]
        if child == parentNode { continue }
        setTree(child, node)
    }
}

func findParent(_ a: Int, _ b: Int) -> Int {
    var a = a, b = b
    if depth[a] < depth[b] {
        swap(&a, &b)
    }

    while depth[a] != depth[b] {
        a = parent[a]
    }

    while a != b {
        a = parent[a]
        b = parent[b]
    }

    return a
}