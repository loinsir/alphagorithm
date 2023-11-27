import Foundation

var tree = [Int: [Int]]()
var visited = [Bool]()

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    
    var candidates = [[Int]]()
    
    for i in 0..<n-1 { // 끊을 전선 선정
        tree = [Int: [Int]]()
        visited = [Bool](repeating: false, count: n+1)
        
        for j in 0..<n-1 { // 끊은 전선 제외하고 트리 완성
            if i == j { continue }    
            tree[wires[j][0], default: []].append(wires[j][1])
            tree[wires[j][1], default: []].append(wires[j][0])
        }
        
        var maxNodes = 0
        var minNodes = Int.max
        
        var realTreeCount = 0
        
        for i in 1...n {
            if visited[i] { continue }
            let nodes = bfs(i)
            if nodes > 0 {
                realTreeCount += 1
            }
            maxNodes = max(maxNodes, nodes)
            minNodes = min(minNodes, nodes)
        }

        if realTreeCount == 2 {
            candidates.append([maxNodes, minNodes])
        }
    }
    
    candidates.sort(by: { abs($0[0] - $0[1]) < abs($1[0] - $1[1])})
    return candidates.isEmpty ? 0 : candidates[0][0] - candidates[0][1]
}

func bfs(_ current: Int) -> Int {
    if visited[current] { return 0 }

    var q = [Int]()
    var idx = 0
    q.append(current)
    while idx < q.count {
        visited[q[idx]] = true
        for child in tree[q[idx], default: []] {
            if visited[child] { continue }
            q.append(child)
        }
        idx += 1
    }

    return q.count
}
