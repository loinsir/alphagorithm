class Queue {
    private var left: [Int] = []
    private var right: [Int] = []

    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }

    func enqueue(_ value: Int) {
        right.append(value)
    }

    func dequeue() -> Int? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}

let N = Int(readLine()!)!
var maps: [[Int]] = Array(repeating: [], count: N+1)

for _ in 1...N-1 {
    let nodes = readLine()!.split(separator: " ").map { Int(String($0))! }
    maps[nodes[0]].append(nodes[1])
    maps[nodes[1]].append(nodes[0])
}

var queue = Queue()
var visited = Array(repeating: false, count: N+1)
var parentNode = 1
var result = Array(repeating: 0, count: N+1)
queue.enqueue(parentNode)

while !queue.isEmpty {
    if let currentNode = queue.dequeue() {
        if visited[currentNode] {
            continue
        }
        visited[currentNode] = true

        maps[currentNode].forEach {
            if !visited[$0] {
                result[$0] = currentNode
                queue.enqueue($0)
            }  
        }
    }
}

for i in result[2...] {
    print(i)
}