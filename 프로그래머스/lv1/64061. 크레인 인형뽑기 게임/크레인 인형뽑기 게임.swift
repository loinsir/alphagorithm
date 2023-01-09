import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var moves = moves
    
    var stack = [Int]()
    var answer = 0
    
    for move in moves {
        for row in 0..<board.count {
            if board[row][move-1] != 0 {
                if !stack.isEmpty && stack.last! == board[row][move-1] {
                    stack.removeLast()
                    answer += 2
                } else {
                    stack.append(board[row][move-1])
                }
                board[row][move-1] = 0
                break
            }
        } 
    }
    return answer
}