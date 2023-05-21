import Foundation

var board = [[Int]]()

func isCheckQuad(_ startY: Int, _ endY: Int, _ startX: Int, _ endX: Int) -> Bool {
    let num = board[startY][startX]
    for i in startY...endY {
        for j in startX...endX {
            if board[i][j] != num {
                return false
            }
        }
    }
    return true
}

func quadCompress(_ startY: Int, _ endY: Int, _ startX: Int, _ endX: Int) -> [Int] {
    if endY == 0 || endX == 0 {
        return board[startY][startX] == 0 ? [1, 0] : [0, 1]
    }
    
    var result = [0, 0]
    if isCheckQuad(startY, endY, startX, endX) {
        return board[startY][startX] == 0 ? [1, 0] : [0, 1]
    } else {
        let first = quadCompress(startY, (startY+endY)/2, startX, (startX+endX)/2)
        let second = quadCompress(startY, (startY+endY)/2, (startX+endX)/2+1, endX)
        let third = quadCompress((startY+endY)/2+1, endY, startX, (startX+endX)/2)
        let fourth = quadCompress((startY+endY)/2+1, endY, (startX+endX)/2+1, endX)
        
        result[0] = first[0] + second[0] + third[0] + fourth[0]
        result[1] = first[1] + second[1] + third[1] + fourth[1]
        
        return result
    }
}

func solution(_ arr:[[Int]]) -> [Int] {
    board = arr
    return quadCompress(0, arr.count-1, 0, arr.count-1)
}