let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1], V = input[2]

var graph: [[Int]] = Array(repeating: [], count: N+1)
var dfsVisits = Array(repeating: false, count: N+1)
var bfsVisits = Array(repeating: false, count: N+1)

for i in 1...M {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[input2[0]].append(input2[1])
    graph[input2[1]].append(input2[0])
}

for i in 1...N {
    graph[i].sort(by: < )
}

var resultsDFS = "\(V)"
var resultsBFS = ""

func dfs(_ node: Int) {
    for i in graph[node] {
        if dfsVisits[i] == false {
            dfsVisits[i] = true
            resultsDFS += " \(i)"
            dfs(i)
        }
    }
}

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

var q = Queue()
func bfs(_ node: Int) {
    q.enqueue(node)

    while let current = q.dequeue() {
        bfsVisits[current] = true
        resultsBFS += "\(current) "
        let willVisits = graph[current]
        for i in willVisits {
            if bfsVisits[i] == false {
                q.enqueue(i)
                bfsVisits[i] = true
            }
        }
    }
}

dfsVisits[V] = true
dfs(V)
bfs(V)

print(resultsDFS)
print(resultsBFS)