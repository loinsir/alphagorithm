import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    
    var graph = Array(repeating: Array(repeating: 100000 * n, count: n+1), count: n+1)
    for i in 0..<fares.count {
        graph[fares[i][0]][fares[i][1]] = fares[i][2]
        graph[fares[i][1]][fares[i][0]] = fares[i][2]
    }
    
    for i in 1...n {
        graph[i][i] = 0
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
            }
        }
    }

    var cost = 100001 * n
    for i in 1...n {
        cost = min(cost, graph[i][a] + graph[i][b] + graph[s][i])
    }
    
    return cost
}