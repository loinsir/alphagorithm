let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = [Int: [(Int, Int)]]()

for i in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (s, d, l) = (input[0], input[1], input[2])
    graph[s, default: []].append((d, l))
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (start, target) = (input[0], input[1])

dijkstra(start, target)

class Heap<T: Comparable> {
    private var nodes: [T] = []
    private let sort: (T, T) -> Bool
    
    init(_ sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    func insert(_ data: T) {
        var index = nodes.count
        nodes.append(data)
        
        while index > 0, sort(nodes[index], nodes[(index - 1) / 2]) {
            nodes.swapAt(index, (index - 1) / 2)
            index = (index - 1) / 2
        }
    }
    
    func delete() -> T {
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let data = nodes.first!
        nodes.swapAt(0, nodes.count - 1)
        nodes.removeLast()
        
        var index = 0
        let limit = nodes.count
        
        while index < limit {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1
            
            let children = [leftChild, rightChild]
            .filter { $0 < limit && sort(nodes[index], nodes[$0]) }
            .sorted { sort(nodes[$0], nodes[$1]) }
            
            if children.isEmpty { break }
            nodes.swapAt(index, children.first!)
            index = children.first!
        }
        
        return data
    }
}

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.dist < rhs.dist
    }
    
    let node: Int
    let dist: Int
    let nodes: [Int]
    
    init(_ node: Int, _ dist: Int, _ nodes: [Int]) {
        self.node = node
        self.dist = dist
        self.nodes = nodes
    }
}

func dijkstra(_ start: Int, _ end: Int) {
    let pq = Heap<Node>(<)
    var distances = [Int](repeating: Int.max, count: n + 1)
    distances[start] = 0
    pq.insert(Node(start, 0, []))
    
    var answer = Node(start, 0, [])
    
    while !pq.isEmpty {
        let current = pq.delete()
        
        if current.node == end {
            answer = current
        }
        
        if current.dist > distances[current.node] {
            continue
        }
        
        for (nextNode, dist) in graph[current.node, default: []] {
            let nextDistance = current.dist + dist
            
            if distances[nextNode] > nextDistance {
                pq.insert(Node(nextNode, nextDistance, current.nodes + [current.node]))
                distances[nextNode] = nextDistance
            }
        }
    }
    
    var answerNodes = answer.nodes + [end]
    print(answer.dist)
    print(answerNodes.count)
    print(answerNodes.map { String($0) }.joined(separator: " "))
}

