let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

class Heap<T: Equatable> {
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
        _ = nodes.popLast()

        let limit = nodes.count
        var index = 0

        while index < limit {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1

            let children = [leftChild, rightChild]
            .filter { $0 < limit && sort(nodes[$0], nodes[index])}
            .sorted { sort(nodes[$0], nodes[$1]) }

            if children.isEmpty { break }

            nodes.swapAt(index, children.first!)
            index = children.first!
        }

        return data
    }
}

var result = [Int]()
var indegree = Array(repeating: 0, count: N+1)
var graph = Array(repeating: [Int](), count: N+1)

for _ in 0..<M {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b) = (info[0], info[1])
    graph[a].append(b)
    indegree[b] += 1
}

func topologySort() {
    
    let q = Heap<Int>(sort: < )
    
    for i in 1...N {
        if indegree[i] == 0 {
            q.insert(i)
        }
    }
    
    while !q.isEmpty {
        let current = q.delete()
        result.append(current)
        
        for child in graph[current] {
            indegree[child] -= 1
            if indegree[child] == 0 {
                q.insert(child)
            }
        }
    }
}
topologySort()
print(result.map { String($0) }.joined(separator: " "))