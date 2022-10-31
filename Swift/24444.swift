let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1], R = input[2]

var graph: [Int: [Int]] = [:]

for i in 1...N {
    graph[i] = []
}

for _ in 1...M {
    let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[edge[0]]!.append(edge[1])
    graph[edge[1]]!.append(edge[0])
}

var visited: [Bool] = Array(repeating: false, count: N + 1)

var result: [Int: Int] = [:]
var visitIdx = 1

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

func bfs(_ vertex: Int) {
    var queue = Queue()

    visited[vertex] = true
    queue.enqueue(vertex)
    result[vertex] = visitIdx
    visitIdx += 1

    while !queue.isEmpty {
        let willVisits = queue.dequeue()!

        for i in graph[willVisits]!.sorted(by: <) {
            if visited[i] == false {
                visited[i] = true
                result[i] = visitIdx
                visitIdx += 1
                queue.enqueue(i)
            }
        }
    }
}

bfs(R)

for i in 1...N {
    if let toPrint = result[i] {
        print(toPrint)
    } else {
        print(0)
    }
}