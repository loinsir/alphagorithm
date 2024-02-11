import Foundation

let nmk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])

var graph = [Int: [(Int, Int)]]()
let INF = Int.max

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b, t) = (input[0], input[1], input[2])
    graph[a, default: []].append((b, t))
    graph[b, default: []].append((a, t))
}

dijkstra(1)

struct Heap<T> {
    var nodes = [T]()
    let sort:(T, T) -> Bool
    init(_ sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    var count: Int {
        return nodes.count
    }
    func leftChild(of parentIndex: Int) -> Int {
        return parentIndex * 2 + 1
    }
    func rightChild(of parentIndex: Int) -> Int {
        return parentIndex * 2 + 2
    }
    func parentIndex(of childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    mutating func shiftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChild(of: parent)
            let right = rightChild(of: parent)
            var candidate = parent
            if left < count && sort(nodes[left], nodes[candidate]) {
                candidate = left
            }
            if right < count && sort(nodes[right], nodes[candidate]) {
                candidate = right
            }
            if candidate == parent {
                return
            }
            nodes.swapAt(parent, candidate)
            parent = candidate
        }
        
    }
    mutating func shiftUp(from index: Int) {
        var child = index
        var parent = parentIndex(of: child)
        while child > 0 && sort(nodes[child], nodes[parent]) {
            nodes.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
        
    }
    mutating func delete() -> T? {
        guard !isEmpty else { return nil }
        nodes.swapAt(0, count-1)
        defer {
            shiftDown(from: 0)
        }
        return nodes.removeLast()
    }
    mutating func insert(_ element: T) {
        nodes.append(element)
        shiftUp(from: count-1)
    }
}

struct Node: Comparable {
    static func <(lhs: Node, rhs: Node) -> Bool {
        return lhs.weight < rhs.weight
    }

    let vertex: Int
    let weight: Int
    let p: Int

    init(_ vertex: Int, _ weight: Int, _ p: Int) {
        self.vertex = vertex
        self.weight = weight
        self.p = p
    }
}

func dijkstra(_ start: Int) {
    var distances = [[Int]](repeating: [Int](repeating: INF, count: k+1), count: n+1)
    distances[start][0] = 0

    var pq = Heap<Node>(<)
    pq.insert(Node(start, 0, 0))

    while !pq.isEmpty {
        guard let currentNode = pq.delete() else { break }

        if distances[currentNode.vertex][currentNode.p] < currentNode.weight {
            continue
        }

        for (nextNode, distance) in graph[currentNode.vertex, default: []] {
            let newDistance = distance + currentNode.weight

            if currentNode.p < k && currentNode.weight < distances[nextNode][currentNode.p + 1] {
                distances[nextNode][currentNode.p + 1] = currentNode.weight
                pq.insert(Node(nextNode, currentNode.weight, currentNode.p + 1))
            }

            if newDistance < distances[nextNode][currentNode.p] {
                distances[nextNode][currentNode.p] = newDistance
                pq.insert(Node(nextNode, newDistance, currentNode.p))
            }
        }
    }

    print(distances[n].min()!)
}