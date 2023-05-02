import Foundation

let n = Int(readLine()!)!
var board1 = [[Int]]()
var board2 = Array(repeating: Array(repeating: 0, count: n), count: n)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    board1.append(input)
}

var answer = 0

for tmp in 0..<1024 {
    for i in 0..<n {
        for j in 0..<n {
            board2[i][j] = board1[i][j]
        }
    }
    var brute = tmp
    for i in 0..<5 {
        let dir = brute % 4
        brute /= 4
        tilt(dir)
        
        for k in 0..<n {
            for l in 0..<n {
                answer = max(answer, board2[k][l])
            }
        }
    }
}

func tilt(_ dir: Int) {
    var dir = dir
    while dir > 0 { 
        rotate() 
        dir -= 1
    }

    for i in 0..<n {
        var idx = 0
        var result = Array(repeating: 0, count: n)
        for j in 0..<n {
            if board2[i][j] == 0 { continue }
            if result[idx] == 0 {
                result[idx] = board2[i][j]
            } else if result[idx] == board2[i][j] {
                result[idx] *= 2
                idx += 1
            } else {
                idx += 1
                result[idx] = board2[i][j]
            }
        }
        for j in 0..<n {
            board2[i][j] = result[j]
        }
    }
}

func rotate() {
    let board = board2
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            board2[i][j] = board[n - 1 - j][i]
        }
    }
}

print(answer)