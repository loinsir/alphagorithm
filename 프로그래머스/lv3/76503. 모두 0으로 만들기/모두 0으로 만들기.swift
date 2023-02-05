import Foundation

func solution(_ a:[Int], _ edges:[[Int]]) -> Int64 {
    
    let sums = a.reduce(0) { $0 + $1 }
    if sums != 0 {
        return Int64(-1)
    }
    
    var children: [[Int]] = Array(repeating: [Int](), count: a.count)
    var a = a
    var answer = 0
    
    for edge in edges {
        children[edge[0]].append(edge[1])
        children[edge[1]].append(edge[0])
    }
    
    func dfs(_ current: Int, _ parent: Int) {
        for child in children[current] {
            if child != parent {
                dfs(child, current)
            }
        }
        
        answer += abs(a[current])
        a[parent] += a[current]
    }
    
    dfs(0, 0)
    
    return Int64(answer)
}