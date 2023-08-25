import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])

var graph = [[Int]](repeating: [Int](), count: n+1)
for _ in 0..<k {
    let num = readLine()!.components(separatedBy: " ").map { Int($0)! }
    graph[num[0]].append(num[1])
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)

func bfs(_ s: Int) {
    var visited = [Bool](repeating: false, count: n+1)
    var queue = [s], idx = 0

    while queue.count > idx {
        let popped = queue[idx]

        for nextNode in graph[popped] {
            if visited[nextNode] { continue }
            visited[nextNode] = true
            queue.append(nextNode)
            dp[s][nextNode] = 1
        }

        idx += 1
    }
}

for i in 1...n {
    bfs(i)
}

let s = Int(readLine()!)!

for _ in 0..<s {
    let num = readLine()!.components(separatedBy: " ").map { Int($0)! }
    if dp[num[0]][num[1]] == 1 {
        print(-1)
    } else if dp[num[1]][num[0]] == 1 {
        print(1)
    } else {
        print(0)
    }
}