import Foundation

var board = [[Int]](repeating: [Int](repeating: -1, count: 6), count: 6)
board[2][2] = 0
board[3][3] = 0
board[2][3] = 1
board[3][2] = 1

let dy = [1, 1, 0, -1, -1, -1, 0, 1], dx = [0, 1, 1, 1, 0, -1, -1, -1, 0]

let n = Int(readLine()!)!
for i in 0..<n {
    let currentNum = (i + 1) % 2
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (y, x) = (input[0] - 1, input[1] - 1)
    
    board[y][x] = currentNum
    
    for dir in 0..<8 {
        var ny = y + dy[dir], nx = x + dx[dir]
        
        if isPossible(ny, nx, dir, currentNum) {
            while 0..<6 ~= ny && 0..<6 ~= nx && board[ny][nx] == (currentNum + 1) % 2 {
                board[ny][nx] = currentNum
                ny += dy[dir]
                nx += dx[dir]
            }
        }
    }
}

display()

func isPossible(_ y: Int, _ x: Int, _ dir: Int, _ num: Int) -> Bool {
    guard 0..<6 ~= y && 0..<6 ~= x && board[y][x] == (num + 1) % 2 else { return false }
    
    var ny = y, nx = x
    var count = 0
    var check = false
    while 0..<6 ~= ny && 0..<6 ~= nx {
        if board[ny][nx] == -1 { return false }
        else if board[ny][nx] == num {
            check = true
            break 
        }
        else { count += 1 }
        ny += dy[dir]
        nx += dx[dir]
    }
    
    if count > 0 && check {
        return true
    } else {
        return false
    }
}

func display() {
    var bCount = 0
    var wCount = 0
    
    for i in 0..<6 {
        var rowString = ""
        for j in 0..<6 {
            if board[i][j] == -1 {
                rowString += "."
            } else if board[i][j] == 0 {
                rowString += "W"
                wCount += 1
            } else {
                rowString += "B"
                bCount += 1
            }
        }
        print(rowString)
    }
    
    if bCount > wCount {
        print("Black")
    } else {
        print("White")
    }
}