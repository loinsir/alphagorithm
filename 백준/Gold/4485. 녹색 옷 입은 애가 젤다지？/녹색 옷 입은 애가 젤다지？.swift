import Foundation

class Heap<T: Comparable> {
    private var nodes: [T] = []
    private let sort: (T, T) -> Bool
    
    init(sort: @escaping ((T, T) -> Bool)) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    func insert(_ data: T) {
        var index = nodes.count
        self.nodes.append(data)
        
        while index >= 0 && sort(nodes[index], nodes[(index-1) / 2]) {
            nodes.swapAt(index, (index-1) / 2)
            index = (index-1) / 2
        } 
    }
    
    func delete() -> T {
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let data = nodes.first!
        nodes.swapAt(0, nodes.count - 1)
        nodes.removeLast()
        
        let limit = nodes.count
        var index = 0
        
        while index < limit {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1
            
            let children = [leftChild, rightChild]
            .filter { $0 < limit && sort(nodes[$0], nodes[index])}
            .sorted { sort(nodes[$0], nodes[$1]) }
            
            if children.isEmpty { break }
            nodes.swapAt(index, children.first!)
            index = children.first!
        }
        return data
    }
}

struct NodePriority: Comparable {
    static func < (lhs: NodePriority, rhs: NodePriority) -> Bool {
        return lhs.priority < rhs.priority
    }
    
    var priority: Int = 0
    let y: Int
    let x: Int
    
    init(_ y: Int, _ x: Int, _ priority: Int) {
        self.y = y
        self.x = x
        self.priority = priority
    }
}

var problem = 1
let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    
    var board = [[Int]]()
    var distances = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    distances[0][0] = 0
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        board.append(input)
    }
    
    let q = Heap<NodePriority>(sort: <)
    q.insert(NodePriority(0, 0, 0)) // y, x, distance
    visited[0][0] = true
    
    while !q.isEmpty {
        let popped = q.delete()
        let y = popped.y, x = popped.x, distance = popped.priority
        
        if distance > distances[y][x] { continue }
        
        for i in 0..<4 {
            let ny = y + dy[i], nx = x + dx[i]

            if 0..<n ~= ny && 0..<n ~= nx && !visited[ny][nx] && board[ny][nx] + distance < distances[ny][nx] {
                distances[ny][nx] = board[ny][nx] + distance
                q.insert(NodePriority(ny, nx, board[ny][nx] + distance))
                visited[ny][nx] = true
            }
        }
    }
    
    print("Problem \(problem): \(distances[n-1][n-1] + board[0][0])")
    problem += 1
}