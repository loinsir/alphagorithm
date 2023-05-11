import Foundation

class Heap<T: Comparable> {
    var nodes: [T] = []
    private let sort: (T, T) -> Bool
    
    init(sort: @escaping ((T, T) -> Bool)) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return self.nodes.isEmpty
    }
    
    func insert(_ data: T) {
        var index = nodes.count
        nodes.append(data)
        
        while index >= 0 && sort(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1) / 2
        }
    }
    
    func delete() -> T {
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let data = nodes.first!
        nodes.swapAt(0, nodes.count-1)
        nodes.removeLast()
        
        var index = 0
        let limit = nodes.count
        
        while index < limit {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1
            
            let children = [leftChild, rightChild]
            .filter { $0 < limit && sort(nodes[$0], nodes[index]) }
            .sorted { sort(nodes[$0], nodes[$1]) }
            
            if children.isEmpty { break }
            nodes.swapAt(index, children.first!)
            index = children.first!
        }
        return data
    }
}

struct NodePriority: Comparable {
    static func < (lhs: NodePriority, rhs: NodePriority) -> Bool {
        return lhs.priority < rhs.priority
    }
    
    var priority: Int = 0
    var node: Int = 0
    
    init(_ node: Int, _ priority: Int) {
        self.node = node
        self.priority = priority
    }
}

var graph = [Int: [Int: Int]]()
var reverseGraph = [Int: [Int: Int]]()
var distances = [Int]()
var visited = [[Bool]]()

func dijkstra(_ start: Int, _ end: Int, _ n: Int) {
    var q = Heap<NodePriority>(sort: < )
    distances = Array(repeating: 7777777, count: n)
    distances[start] = 0
    q.insert(NodePriority(start, 0))
    
    while !q.isEmpty {
        let popped = q.delete()
        let node = popped.node, distance = popped.priority
        
        if node == end { continue }
        
        for (key, value) in graph[node]! {
            if !visited[node][key] && distances[key] > distance + value {
                distances[key] = distance + value
                q.insert(NodePriority(key, distance + value))
            }
        } 
    }
}

func bfs(_ s: Int, _ d: Int) {
    var q = [Int]()
    var idx = 0
    q.append(d)
    while idx < q.count {
        let node = q[idx]
        if node == s {
            idx += 1
            continue 
        }
        
        for (key, value) in reverseGraph[node]! {
            if distances[key] + value == distances[node] && !visited[key][node] {
                q.append(key)
                visited[key][node] = true
            }
        }
        idx += 1
    }
}

while true {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (input[0], input[1])
    
    if n == 0 && m == 0 { break }
    
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (s, d) = (input2[0], input2[1])
    
    graph = [Int: [Int: Int]]()
    reverseGraph = [Int: [Int: Int]]() // 역방향 그래프
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    for i in 0..<n {
        graph[i] = [:]
        reverseGraph[i] = [:]
    }
    for _ in 0..<m {
        let info = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (u, v, p) = (info[0], info[1], info[2])
        graph[u]![v] = p
        reverseGraph[v]![u] = p 
    }

    dijkstra(s, d, n)
    bfs(s, d)
    dijkstra(s, d, n)
    bfs(s, d)

    if distances[d] == 7777777 {
        print(-1)
    } else {
        print(distances[d])
    }
}