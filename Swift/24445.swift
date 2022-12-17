let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1], R = input[2]

var graph: [[Int]] = Array(repeating: [Int](), count: N+1)
var visited = [Int](repeating: 0, count: N+1)
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

    graph[u].append(v)
    graph[v].append(u)
}

graph = graph.map { $0.sorted(by: > )}

queue.enqueue(R)
visited[R] = count

while let currentNode = queue.dequeue() {
    let willVisits = graph[currentNode]

    for node in willVisits {
        if visited[node] == 0 {
            count += 1
            visited[node] = count
            queue.enqueue(node)
        }
    }
}

for i in 1..<visited.count {
    print(visited[i])
}