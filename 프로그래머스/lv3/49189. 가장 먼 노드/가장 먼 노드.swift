import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var edge = edge.sorted(by: { $0[0] < $1[1] })
    var graph = [Int: [Int]]()
    var distance = Array(repeating: 0, count: n+1)
    
    for i in 1...n {
        graph[i] = []
    }
    
    for e in edge {
        graph[e[0]]!.append(e[1])
        graph[e[1]]!.append(e[0])
    }
    
    var queue = [1]
    var visited = Array(repeating: 0, count: n+1)
    visited[1] = 1
    while !queue.isEmpty {
        let currentNode = queue.removeFirst()
        let currentDistance = distance[currentNode]
        
        for node in graph[currentNode]! {
            if visited[node] == 0 {
                visited[node] = 1
                queue.append(node)
                distance[node] += currentDistance + 1
            }
        }
    }
    
    let maxDistance = distance.max()!
    var answer = 0 
    
    for i in distance {
        if i == maxDistance {
            answer += 1
        }
    }

    return answer
}