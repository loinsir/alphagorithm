let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var edges = [[Int]]()
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b, c) = (input[0], input[1], input[2])
    edges.append([a, b, c])
}

var distances = [Int](repeating: Int.max, count: n + 1)

func belmanFord(_ start: Int) -> Bool {
    distances[start] = 0
    for round in 1...n+1 {
        for j in 0..<m {
            let currentNode = edges[j][0]
            let nextNode = edges[j][1]
            let distance = edges[j][2]

            if distances[currentNode] != Int.max && distances[nextNode] > distances[currentNode] + distance {
                distances[nextNode] = distances[currentNode] + distance
                if round == n+1 {
                    return true
                }
            }
        }
    }

    return false
}

let hasCycle = belmanFord(1)

if hasCycle {
    print(-1)
} else {
    for i in 2...n {
        print(distances[i] == Int.max ? -1 : distances[i])
    }
}