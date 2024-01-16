import Foundation

var map = [[Int]]()
var startY = 0
var startX = 0
for i in 0..<3 {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(row)
    
    for j in 0..<3 {
        if row[j] == 0 {
            startY = i
            startX = j
        }
    }
}

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

let answerState = "123456780"

struct State {
    let state: String
    let y: Int
    let x : Int
    let count: Int
    
    init(_ state: String, _ y: Int, _ x: Int, _ count: Int = 0) {
        self.state = state
        self.y = y
        self.x = x
        self.count = count
    }
}

var answer = Int.max
bfs()
print(answer == Int.max ? -1 : answer)

func bfs() {
    var visited = [String: Bool]()
    var q = [State]()
    var idx = 0
    
    q.append(State(mapToState(map), startY, startX))
    visited[mapToState(map)] = true
    
    while idx < q.count {
        let popped = q[idx]
        
        if popped.state == answerState {
            answer = min(answer, popped.count)
            idx += 1
            continue
        }
        
        for i in 0..<4 {
            let ny = popped.y + dy[i], nx = popped.x + dx[i]
            let nc = popped.count + 1
            
            if 0..<3 ~= ny && 0..<3 ~= nx {
                var ns = popped.state
                ns.swapAt(ny * 3 + nx, popped.y * 3 + popped.x)

                if visited[ns] == true {
                    continue
                }

                visited[ns] = true
                q.append(State(ns, ny, nx, nc))
            }
        }
        
        idx += 1
    }
}

func mapToState(_ map: [[Int]]) -> String {
    var result = ""
    map.forEach { r in result += r.map { String($0) }.joined() }
    return result
}

func stateToMap(_ state: String) -> [[Int]] {
    var map = [[Int]]()
    for i in stride(from: 0, to: 9, by: 3) {
        var row = [Int]()
        for j in 0..<3 {
            row.append(Int(state[(i + j)])!)
        }
        map.append(row)
    }
    return map
}

extension String {
    subscript(_ index: Int) -> String {
        String(self[self.index(self.startIndex, offsetBy: index)])
    }

    mutating func swapAt(_ index1: Int, _ index2: Int) {
        var characters = Array(self)
        characters.swapAt(index1, index2)
        self = String(characters)
    }
}