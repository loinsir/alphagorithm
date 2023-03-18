import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var maxVal = 0
    var square = board
    
    if board.count == 1 || board.filter({$0.count > 1}).count == 0 {
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                if board[row][col] == 1 {
                    return 1
                }
            }
        }
        return 0
    }
    
    for row in 1..<board.count {
        for col in 1..<board[row].count {
       
            if board[row][col] == 1 {

                square[row][col] += min(square[row-1][col], square[row-1][col-1], square[row][col-1])
                
                maxVal = max(maxVal, square[row][col])
            }
        }
    }
    return maxVal * maxVal
}