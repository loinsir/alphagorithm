let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1], R = input[2]

var graph: [Int: [Int]] = [:]
var visited = [Bool](repeating: false, count: N+1)
var result = [Int](repeating: 0, count: N+1)
var count = 1

struct Queue {
    private var left: [Int] = []
    private var right: [Int] = []

    var isEmpty: Bool {
        left.isEmpty && right.isEmpty
    }

    mutating func enqueue(_ value: Int) {
        right.append(value)
    }

    mutating func dequeue() -> Int? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}

var queue = Queue()

for _ in 1...M {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    let u = input2[0], v = input2[1]

    if graph[u] == nil {
        graph[u] = [v]
    } else {
        graph[u]!.append(v)
    }

    if graph[v] == nil {
        graph[v] = [u]
    } else {
        graph[v]!.append(u)
    }
}

queue.enqueue(R)

while let currentNode = queue.dequeue() {
    visited[currentNode] = true
    if result[currentNode] == 0 {
        result[currentNode] = count
        count += 1
    }
    let willVisits = graph[currentNode]!.sorted(by: > )

    for node in willVisits {
        if visited[node] == false {
            queue.enqueue(node)
        }
    }
}

for i in result[1...] {
    print(i)
}