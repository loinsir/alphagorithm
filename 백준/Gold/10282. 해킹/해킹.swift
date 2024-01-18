import Foundation

let t = Int(readLine()!)!
var graph = [Int: [Int: Int]]()

var n = 0
var d = 0
var c = 0

for _ in 0..<t {
    
    let ndc = readLine()!.split(separator: " ").map { Int($0)! }
    (n, d, c) = (ndc[0], ndc[1], ndc[2])
    
    graph = [Int: [Int: Int]]()
    for _ in 0..<d {
        let abs = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b, s) = (abs[0], abs[1], abs[2])
        graph[b, default: [Int: Int]()][a] = s
    }
    
    let distances = dijkstra(start: c)
    var computers = 0
    var seconds = 0

    for i in 1...n {
        if distances[i] != Int.max {
            computers += 1
            seconds = max(seconds, distances[i])
        }
    }

    print(computers, seconds)
}

class Heap<T: Comparable> {
    private var nodes: [T] = []
    private let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    func insert(_ data: T) {
        var index = nodes.count
        nodes.append(data)
        
        while index > 0 && sort(nodes[index], nodes[(index - 1) / 2]) {
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

func dijkstra(start: Int) -> [Int] {
    let pq = Heap<Node>(sort: <)
    var distances = [Int](repeating: Int.max, count: n + 1)
    
    pq.insert(Node(start, 0))
    distances[start] = 0
    
    while !pq.isEmpty {
        let node = pq.delete()
        let currentNode = node.point, currentDist = node.dist
        
        if currentDist > distances[currentNode] {
            continue
        }
        
        for (key, value) in graph[currentNode, default: [Int : Int]()] {
            let nextDist = currentDist + value

            if nextDist < distances[key] {
                distances[key] = nextDist
                pq.insert(Node(key, nextDist))
            }
        }
    }

    return distances
}