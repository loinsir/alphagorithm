import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, l) = (input[0], input[1])

var board = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(row)
}

var answer = 0
for i in 0..<n {
    if checkRow(i) {
        answer += 1
    }
}

board = rotate()
for i in 0..<n {
    if checkRow(i) {
        answer += 1
    }
}
print(answer)

func rotate() -> [[Int]] {
    var rotated = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            rotated[i][j] = board[n-j-1][i]
        }
    }
    
    return rotated
}

func checkRow(_ y: Int) -> Bool {
    let row = board[y]
    var row2 = Array(repeating: 0, count: n)
    for i in 1..<n {
        if row[i] - row[i-1] == 1 { // 더 큰 기둥 만났을 경우
            guard 0..<n ~= i-l && 0..<n ~= i-1 && i-l <= i-1  else { return false }
            guard Array(row[i-l...i-1]).allSatisfy ({ $0 == row[i-1] }) else { return false }
            guard Array(row2[i-l...i-1]).allSatisfy({$0 == 0}) else { return false }

            for j in i-l...i-1 {
                row2[j] = 1
            }
            
        } else if row[i] - row[i-1] == -1 { // 기둥 높이가 낮아진 경우
            guard 0..<n ~= i && 0..<n ~= i+l-1 && i <= i+l-1 else { return false }

            guard Array(row[i...i+l-1]).allSatisfy({$0 == row[i]}) else { return false }
            guard Array(row2[i...i+l-1]).allSatisfy({$0 == 0}) else { return false }

            for j in i...i+l-1 {
                row2[j] = 1
            }
            
        } else if row[i-1] == row[i] {
            continue
        } else {
            return false
        }
    }
    return true
}