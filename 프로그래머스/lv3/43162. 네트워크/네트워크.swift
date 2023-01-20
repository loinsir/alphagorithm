import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var count = 0
    var visited = Array(repeating: 0, count: n)
    
    func dfs(_ node: Int, _ depth: Int) {
        if visited[node] == 1 || depth == n {
            return
        }
        
        visited[node] = 1
        
        if depth == 0 {
            count += 1
        }
        
        for i in 0..<n {
            if computers[node][i] == 1 && visited[i] == 0 && node != i {
                dfs(i, depth+1)
            }
        }
    }
    
    for i in 0..<n {
        dfs(i, 0)
    }
    
    return count
}