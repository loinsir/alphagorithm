import Foundation

var answer = 0

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    bfs(dungeons, k)
    
    return answer
}

func bfs(_ dungeons: [[Int]], _ k: Int) {
    var q = [Node]()
    var idx = 0
    
    for (index, dungeon) in dungeons.enumerated() {
        if k >= dungeon[0] {
            q.append(Node(k - dungeon[1], [index]))
        }
    }
    
    while q.count > idx {
        let popped = q[idx]
        let kValue = popped.k
        let visited = popped.visited
        
        for i in 0..<dungeons.count {
            if !visited.contains(i) && dungeons[i][0] <= kValue {
                q.append(Node(kValue - dungeons[i][1], visited + [i]))
            }
        }
        
        answer = max(visited.count, answer)
        idx += 1
    }
}

struct Node {
    var k: Int
    var visited: [Int]
    
    init(_ k: Int, _ visited: [Int]) {
        self.k = k
        self.visited = visited
    }
}
