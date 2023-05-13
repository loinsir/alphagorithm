import Foundation

struct Node {
    var y: Int = 0
    var x: Int = 0
    var moved: Int = 0
    var str: String = ""
    
    init(_ y: Int, _ x: Int, _ moved: Int, _ str: String) {
        self.y = y
        self.x = x
        self.moved = moved
        self.str = str
    }
}

class Queue<T> {
    private var left: [T] = []
    private var right: [T] = []
    
    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }
    
    func append(_ data: T) {
        right.append(data)
    } 
    
    func pop() -> T? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}

let dy = [0, -1, 1, 0]
let dx = [1, 0, 0, -1]

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    
    var q = Queue<Node>()
    var answers = [String]()
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: k+1), count: n+1), count: m+1)
    q.append(Node(y, x, 0, ""))
    visited[y][x][0] = true
    
    while !q.isEmpty {
        let node = q.pop()!
        let y = node.y, x = node.x, moved = node.moved, str = node.str
        
        if y == c && x == r && moved == k {
            return str
        }
        
        if moved == k {
            continue
        }
        
        for i in 0..<4 {
            let ny = y + dy[i], nx = x + dx[i]
            var dir = "l"
            if i == 0 {
                dir = "d"
            } else if i == 1 {
                dir = "l"
            } else if i == 2 {
                dir = "r"
            } else if i == 3 {
                dir = "u"
            }
            if 1...m ~= ny && 1...n ~= nx && moved < k && !visited[ny][nx][moved+1] {
                visited[ny][nx][moved+1] = true
                q.append(Node(ny, nx, moved + 1, str + dir))
            }
        }
    }
    return answers.isEmpty ? "impossible" : answers.first!
}