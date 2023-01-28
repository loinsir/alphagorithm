import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var table = [[Int]]()
    var answer = [Int]()
    for i in 1...rows {
        table.append(Array((i-1)*columns+1...i*columns))
    }
    
    func rotation(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) {
        var stack = [Int]()
        
        stack.append(contentsOf: Array(table[x1][y1...y2]))
        stack.removeLast()
        for i in x1...x2 {
            stack.append(table[i][y2])
        }
        stack.removeLast()
        stack.append(contentsOf: Array(table[x2][y1...y2]).reversed())
        stack.removeLast()
        for i in stride(from: x2, to: x1, by: -1) {
            stack.append(table[i][y1])
        }
        
        answer.append(stack.min()!)
        
        for i in x1...(x2-1) {
            table[i][y1] = stack.popLast()!
        }
        for i in y1...(y2-1) {
            table[x2][i] = stack.popLast()!
        }
        for i in stride(from: x2, to: x1, by: -1) {
            table[i][y2] = stack.popLast()!
        }
        for i in stride(from: y2, to: y1, by: -1) {
            table[x1][i] = stack.popLast()!
        }
    }
    
    for query in queries {
        rotation(query[0]-1, query[1]-1, query[2]-1, query[3]-1)
    }
    
    return answer
}