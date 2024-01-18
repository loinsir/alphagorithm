import Foundation

class Heap<T: Comparable> {
    private var nodes: [T] = []
    private let sort: (T, T) -> Bool

    init(_ sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    var isEmpty: Bool {
        nodes.isEmpty
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

        let limit = nodes.count
        var index = 0

        while index < limit {
            let leftChild = (index * 2) + 1
            let rightChild = leftChild + 1

            let children = [leftChild, rightChild]
            .filter { $0 < limit && sort(nodes[$0], nodes[index])}
            .sorted { sort(nodes[$0], nodes[$1]) }

            if children.isEmpty {
                break
            }

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

    init(_ node: Int, _ dist: Int) {
        self.node = node
        self.dist = dist
    }
}

let ne = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, e) = (ne[0], ne[1])

var graph = Array(repeating: [(Int, Int)](), count: n+1)

for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    graph[a].append((b, c))
    graph[b].append((a, c))
}

let v = readLine()!.split(separator: " ").map { Int(String($0))! }
let (v1, v2) = (v[0], v[1])

func dijkstra(start: Int) -> [Int] {
    var distances = [Int](repeating: 1000000000, count: n+1)
    distances[start] = 0

    var pq = Heap<Node>(<)
    pq.insert(Node(start, 0))

    while !pq.isEmpty {
        let current = pq.delete()
        let (currentNode, currentDist) = (current.node, current.dist)

        if distances[currentNode] < currentDist {
            continue
        }

        for (nextNode, nextCost) in graph[currentNode] {
            let nextDistance = currentDist + nextCost

            if nextDistance < distances[nextNode] {
                distances[nextNode] = nextDistance
                pq.insert(Node(nextNode, nextDistance))
            }
        }
    }

    return distances
}

let dist1 = dijkstra(start: 1)
let dist2 = dijkstra(start: v1)
let dist3 = dijkstra(start: v2)

let first = dist1[v1] + dist2[v2] + dist3[n]
let second = dist1[v2] + dist3[v1] + dist2[n]

let ans = min(first, second)

print(ans >= 1000000000 ? -1 : ans)