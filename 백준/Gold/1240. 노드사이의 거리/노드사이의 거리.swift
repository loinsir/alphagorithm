import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])

var graph = [[[Int]]](repeating: [[Int]](), count: N+1)

for _ in 1...N-1 {
    let info = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let (node1, node2, dist) = (info[0], info[1], info[2])
    
    graph[node1].append([node2, dist])
    graph[node2].append([node1, dist])
}

var answer = 100000
for _ in 1...M {
    let info = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let (start, target) = (info[0], info[1])
    bfs(start, target)
    print(answer)
    answer = 100000
}

func bfs(_ start: Int, _ end: Int) {
    var q = [[Int]]()
    var index = 0
    q.append([start, 0])

    var visited = [Bool](repeating: false, count: N+1)
    visited[start] = true

    while q.count > index {
        let popped = q[index]
        let node = popped[0], distance = popped[1]

        if node == end {
            answer = distance
            return
        }

        for info in graph[node] {
            let nextNode = info[0], dist = info[1]
            if visited[nextNode] == false {
                visited[nextNode] = true
                q.append([nextNode, distance + dist])
            } 
        }

        index += 1
    }
}