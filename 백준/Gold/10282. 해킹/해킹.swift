import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let INF = 100000000
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let N = line[0]
    let D = line[1]
    let C = line[2]-1
    var arr = Array(repeating: [(node:Int, cost:Int)](), count: N)
    var minCost = Array(repeating: INF, count: N)
    
    for _ in 0..<D{
        let line = readLine()!.split(separator: " ").map{Int($0)!}
        let A = line[0]-1
        let B = line[1]-1
        let S = line[2]
        
        arr[B].append((A,S))
    }
    
    func dijk(from:Int){
        var visited = Array(repeating: false, count: N)
        var q = [(node:Int, cost:Int)]()
        q.append((from,0))
        minCost[from] = 0
        
        while !q.isEmpty{
            q.sort(by: {$0.cost > $1.cost})
            let curr = q.removeLast()
            visited[curr.node] = true
            
            for next in arr[curr.node]{
                if visited[next.node]{ continue }
                let newCost = curr.cost + next.cost
                
                if minCost[next.node] > newCost{
                    minCost[next.node] = newCost
                    q.append((next.node,newCost))
                }
            }
        }
    }
    dijk(from: C)
    var ans:(cnt:Int, cost:Int) = (0,0)
    for cost in minCost{
        if cost < INF{
            ans.cnt+=1
            ans.cost = max(ans.cost, cost)
        }
    }
    print(ans.cnt,ans.cost)
}