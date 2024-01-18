import Foundation

let t = Int(readLine()!)!
var graph = [[(Int, Int)]]()
var distances = [Int](repeating: Int.max, count: n + 1)

var n = 0
var d = 0
var c = 0

for _ in 0..<t {
    
    let ndc = readLine()!.split(separator: " ").map { Int($0)! }
    (n, d, c) = (ndc[0], ndc[1], ndc[2])
    
    graph = [[(Int, Int)]](repeating: [(Int, Int)](), count: n + 1)
    
    for _ in 0..<d {
        let abs = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b, s) = (abs[0], abs[1], abs[2])
        graph[b].append((a, s))
    }
    
    distances = [Int](repeating: Int.max, count: n + 1)
    dijkstra(start: c)
    var computers = 0
    var seconds = 0

    for i in 1...n {
        if distances[i] < Int.max {
            computers += 1
            seconds = max(seconds, distances[i])
        }
    }

    print(computers, seconds)
}

final class Heap<T: Comparable> {
    private var nodes: [T] = []
    private let sort: (T, T) -> Bool
    
    init(sort: @escaping ((T, T) -> Bool)) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        nodes.isEmpty
    }
    
    func insert(_ data: T) {
        var index = nodes.count
        nodes.append(data)
        
        while index >= 0, sort(nodes[index], nodes[(index-1) / 2]) {
            nodes.swapAt(index, (index - 1) / 2)
            index = (index-1) / 2
        }
    }
    
    func delete() -> T {
        if nodes.count == 1 {
            return nodes.removeFirst()
        }
        
        let data = nodes.first!
        nodes.swapAt(0, nodes.count - 1)
        nodes.removeLast()
        
        let limit = nodes.count
        var index = 0
        
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

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.dist < rhs.dist
    }
    
    let point: Int
    let dist: Int
    
    init(_ point: Int, _ dist: Int) {
        self.point = point
        self.dist = dist
    }
}

func dijkstra(start: Int) {
    var pq = [Node]()
    var visited = [Bool](repeating: false, count: n + 1)
    pq.append(Node(start, 0))
    distances[start] = 0
    
    while !pq.isEmpty {
        pq.sort { $0.dist > $1.dist }
        let node = pq.removeLast()
        
        let currentNode = node.point, currentDist = node.dist
        visited[currentNode] = true
        
        for (key, value) in graph[currentNode] {
            let nextDist = currentDist + value
            if visited[key] { continue }
            if nextDist < distances[key] {
                distances[key] = nextDist
                pq.append(Node(key, nextDist))
            }
        }
    }
}