import Foundation

let t = Int(readLine()!)!

let nmk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])

var graph = [Int: [(Int, Int, Int)]]()

for _ in 0..<k {
    let uvcd = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v, c, d) = (uvcd[0], uvcd[1], uvcd[2], uvcd[3])

    graph[u, default: []].append((v, c, d))
}

for (k, v) in graph {
    graph[k] = v.sorted(by: { $0.2 < $1.2 })
}

class Heap<T: Comparable> {
    private var nodes: [T] = []
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
    let cost: Int

    init(_ node: Int, _ weight: Int, _ cost: Int) {
        self.node = node
        self.weight = weight
        self.cost = cost
    }
}

dijkstra(1)

func dijkstra(_ start: Int) {
    var distances = [[Int]](repeating: [Int](repeating: Int.max, count: m+1), count: n+1)
    distances[start][0] = 0

    let pq = Heap<Node>(<)
    pq.insert(Node(start, 0, 0))

    while !pq.isEmpty {
        let current = pq.delete()

        if current.weight > distances[current.node][current.cost] || current.cost > m {
            continue
        }

        for (nextNode, nextCost, nextDistance) in graph[current.node, default: []] {
            let dist = nextDistance + current.weight
            let cost = nextCost + current.cost

            if cost <= m && distances[nextNode][cost] > dist {

                for j in cost..<m+1 {
                    if distances[nextNode][j] <= dist { break }
                    distances[nextNode][j] = dist
                }

                pq.insert(Node(nextNode, dist, cost))
            }
        }
    }

    let ans = distances[n][m]
    print(ans == Int.max ? "Poor KCM" : ans)
}

