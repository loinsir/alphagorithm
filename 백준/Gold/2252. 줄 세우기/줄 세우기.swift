import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]

var graph = Array(repeating: [Int](), count: N+1)
var indegree = Array(repeating: 0, count: N+1)
var result = [Int]()

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b) = (input[0], input[1])
    graph[a].append(b)
    indegree[b] += 1
}

func topologySort() {
    
    var q = [Int]()
    var index = 0
    
    for i in 1..<indegree.count {
        if indegree[i] == 0 {
            q.append(i)
        }
    }
    
    while index < q.count {
        let current = q[index]
        result.append(current)
        
        for child in graph[current] {
            indegree[child] -= 1
            if indegree[child] == 0 {
                q.append(child)
            }
        }
        
        index += 1
    }
}

topologySort()
print(result.map { String($0) }.joined(separator: " "))