import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    
    var graph: [Int: [Int]] = [:]
    for i in 1...n {
        graph[i] = []
    }
    
    for result in results {
        graph[result[0]]!.append(result[1])
    }

    func dfs(_ node: Int, _ IOCount: inout [[Int]], _ base: Int, _ visited: inout [Int]) {
        visited[node] = 1
        
        if base != node {
            IOCount[node][0] += 1
            IOCount[base][1] += 1
        }
        
        for n in graph[node]! {
            if visited[n] == 0 {
                dfs(n, &IOCount, base, &visited)
            }
        }
    }
    
    var ioCount = Array(repeating: Array(repeating: 0, count: 2), count: n+1)
    for i in 1...n {
        var visited = Array(repeating: 0, count: n+1)
        dfs(i, &ioCount, i, &visited)
    }

    var count = 0
    for i in 1...n {
        if ioCount[i][0] + ioCount[i][1] == n-1 {
            count += 1
        }
    }
    print(ioCount)
    return count
}