import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var graph = [Int: [(Int, Int)]]()
var path = [[Int]](repeating: [Int](), count: n+1)

for _ in 0..<m {
    let abt = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b, t) = (abt[0], abt[1], abt[2])
    graph[a, default: []].append((b, t))
    graph[b, default: []].append((a, t))
}

let dist = dijkstra(1)[n]
var late = dist

var node = n
while !path[node].isEmpty {
    late = max(late, dijkstra(1, true, node, path[node][0])[n])
    node = path[node][0]
} 

if late == 10001 {
    print(-1)
} else {
    print(late - dist)
}

final class Heap<T: Comparable> {
    private var nodes = [T]()
    private let sort: (T, T) -> Bool

    var isEmpty: Bool {
        nodes.isEmpty
    }

    init(_ sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    func insert(_ data: T) {
        var index = nodes.count
        nodes.append(data)

        while index >= 0, sort(nodes[index], nodes[(index - 1) / 2]) {
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
            var candidate = index

            if leftChild < limit && sort(nodes[leftChild], nodes[candidate]) {
                candidate = leftChild
            }

            if rightChild < limit && sort(nodes[rightChild], nodes[candidate]) {
                candidate = rightChild
            }

            if candidate == index { break }
            nodes.swapAt(index, candidate)
            index = candidate
        }

        return data
    }
}

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.weight < rhs.weight
    }

    let node: Int
    let weight: Int

    init(_ node: Int, _ weight: Int) {
        self.node = node
        self.weight = weight
    }
}

func dijkstra(_ start: Int, _ filter: Bool = false, _ except1: Int = 0, _ except2: Int = 0) -> [Int] {
    var distances = [Int](repeating: 10001, count: n+1)
    distances[start] = 0

    let pq = Heap<Node>(<)
    pq.insert(Node(start, 0))

    while !pq.isEmpty {
        let currentNode = pq.delete()

        if currentNode.weight > distances[currentNode.node] {
            continue
        }

        for (nextNode, weight) in graph[currentNode.node, default: []] {
            let nextWeight = weight + currentNode.weight

            if filter && ((except1 == nextNode && except2 == currentNode.node) || (except2 == nextNode && except1 == currentNode.node)) {
                continue
            }

            if distances[nextNode] > nextWeight {
                distances[nextNode] = nextWeight
                pq.insert(Node(nextNode, nextWeight))

                if !filter {
                    path[nextNode].removeAll()
                    path[nextNode].append(currentNode.node)
                }

            } else if distances[nextNode] == nextWeight && !filter {
                path[nextNode].append(currentNode.node)
            }
        }
    }
    return distances
}