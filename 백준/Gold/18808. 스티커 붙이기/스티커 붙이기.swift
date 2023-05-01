import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, k) = (input[0], input[1], input[2])

var board = Array(repeating: Array(repeating: 0, count: m), count: n)
for _ in 0..<k {
    let size = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (r, c) = (size[0], size[1])
    var sticker = [[Int]]()
    for _ in 0..<r {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        sticker.append(row)
    }
    
    for i in 0..<4 {
        let rotatedSticker = rotated(sticker, i) 
        var flag = false
        // check하고 만약 붙였으면 break
        for nx in 0..<n {
            for ny in 0..<m {
                if canSticker(rotatedSticker, board, nx, ny) {
                    pasteSticker(rotatedSticker, &board, nx, ny)
                    flag = true
                    break
                }
            }

            if flag {
                break
            }
        }

        if flag {
            break
        }
    }
}

func canSticker(_ sticker: [[Int]], _ board: [[Int]], _ x: Int, _ y: Int) -> Bool {
    for i in 0..<sticker.count {
        for j in 0..<sticker[0].count {
            guard 0..<board.count ~= x + i && 0..<board[0].count ~= y + j else { return false }
            if sticker[i][j] == 1 && board[x + i][y + j] == 1 {
                return false
            }
        }
    }
    return true
}

func pasteSticker(_ sticker: [[Int]], _ board: inout [[Int]], _ x: Int, _ y: Int) {
    for i in 0..<sticker.count {
        for j in 0..<sticker[0].count {
            if sticker[i][j] == 1 {
                board[x + i][y + j] = 1
            }
        }
    }
}

func rotated(_ sticker: [[Int]], _ dir: Int) -> [[Int]] {
    if dir == 0 { // 0
        return sticker
    } else { // 90
        let width = sticker.count
        let height = sticker[0].count
        
        var result = Array(repeating: Array(repeating: 0, count: width), count: height)
        for i in 0..<height {
            for j in 0..<width {
                result[i][j] = sticker[width - j - 1][i]
            }
        }
        return rotated(result, dir - 1)
    }
}

var answer = 0
for i in 0..<n {
    for j in 0..<m {
        if board[i][j] == 1 {
            answer += 1
        }
    }
}

print(answer)