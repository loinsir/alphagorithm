import Foundation

struct NodePriority: Comparable {
    static func < (lhs: NodePriority, rhs: NodePriority) -> Bool {
        lhs.priority < rhs.priority
    }
    
    var node: Int
    var priority: Int
    
    init(_ node: Int, _ priority: Int) {
        self.node = node
        self.priority = priority
    }
}

class Heap<T: Comparable> {
    var nodes: [T] = []
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
        
        while index >= 0 && sort(nodes[index], nodes[(index-1) / 2]) {
            nodes.swapAt(index, (index-1) / 2)
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

func dijkstra(_ graph: [Int: [Int: Int]], _ start: Int) -> [Int: Int] {
    var distances = [Int: Int]()
    var q = Heap<NodePriority>(sort: <)
    q.insert(NodePriority(start, 0))
    
    for key in graph.keys {
        let value = key == start ? 0 : 7777777
        distances.updateValue(value, forKey: key)
    }
    
    while !q.isEmpty {

        let popped = q.delete()
        
        if distances[popped.node]! < popped.priority {
            continue
        }
        
        for (node, priority) in graph[popped.node]! {
            let distance = priority + popped.priority
            if distance < distances[node]! {
                distances[node] = distance
                q.insert(NodePriority(node, distance))
            }
        }
    }
    
    return distances
}


let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (V, E) = (input[0], input[1])

let start = Int(readLine()!)!

var d = [Int: [Int: Int]]()

for i in 1...V {
    d[i] = [:]
}

for _ in 0..<E {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v, w) = (row[0], row[1], row[2])
    if d[u]![v] == nil {
        d[u]![v] = w
    } else {
        if d[u]![v]! > w {
            d[u]?.updateValue(w, forKey: v)
        }
    }
}

let dist = dijkstra(d, start)

for i in 1...V {
    print(dist[i] == 7777777 ? "INF" : dist[i]!)
}

