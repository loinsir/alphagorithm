import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
let bowls = readLine()!.components(separatedBy: " ").map { Int($0)! }

var board = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

let dy = [1, 0, -1, 0], dx = [0, 1, 0, -1]
for i in 0..<n {
    board[n-1][i] = bowls[i]
}

var answer = 0

while !kCheck() {
    answer += 1
    oneFish()
    levitationRollAndPut()
    controlFish()
    putFloor()
    halfLevitationAndRoll()
    controlFish()
    putFloor()
}

print(answer)

func oneFish() {
    let minFish = board[n-1].min()!
    
    for i in 0..<n {
        if board[n-1][i] == minFish {
            board[n-1][i] += 1
        }
    }
    
    board[n-2][1] = board[n-1][0]
    board[n-1][0] = 0
}

func levitationRollAndPut() {
    var leftMostX = 0
    // 가장 왼쪽 어항 x좌표 찾기
    for x in 0..<n {
        if board[n-1][x] != 0 {
            leftMostX = x
            break
        }
    }
    
    var heightY = n-1
    // 가장 왼쪽 어항 중 제일 높은 어항 좌표 찾기
    for y in stride(from: n-1, through: 0, by: -1) {
        guard board[y][leftMostX] != 0 else { break }
        heightY = y
    }

    var limitX = leftMostX
    for x in leftMostX..<n {
        if board[heightY][x] == 0 { break }
        limitX = x
    }

    if n - heightY > n - limitX - 1 { return }
    
    var tmpArr = [[Int]]()
    for x in leftMostX...limitX {
        var tmpRow = [Int]()
        for y in stride(from: n-1, through: heightY, by: -1) {
            tmpRow.append(board[y][x])
            board[y][x] = 0
        }
        tmpArr.append(tmpRow)
    }

    for y in 0..<tmpArr.count {
        for x in 0..<tmpArr[0].count {
            board[n-1 - tmpArr.count + y][limitX + 1 + x] = tmpArr[y][x]
        }
    }

    levitationRollAndPut()
}

func kCheck() -> Bool {
    return board[n-1].max()! - board[n-1].min()! <= k
}

func controlFish() {
    var alpha = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
    for y in 0..<n {
        for x in 0..<n {
            guard board[y][x] != 0 && !visited[y][x] else { continue }
            
            for i in 0..<4 {
                let ny = y + dy[i], nx = x + dx[i]
                guard 0..<n ~= ny && 0..<n ~= nx && board[ny][nx] != 0 else { continue }
                let d = abs(board[y][x] - board[ny][nx]) / 5
                if d > 0 {
                    if board[ny][nx] > board[y][x] {
                        alpha[ny][nx] -= d
                        alpha[y][x] += d
                    } else {
                        alpha[y][x] -= d
                        alpha[ny][nx] += d
                    }
                }
                visited[ny][nx] = true
                visited[y][x] = true
            }
        }
    }
    
    for y in 0..<n {
        for x in 0..<n {
            board[y][x] += alpha[y][x]
        }
    }
}

func putFloor() {
    var arr = [Int]()
    for x in 0..<n {
        for y in stride(from: n-1, through: 0, by: -1) {
            guard board[y][x] != 0 else { continue }
            arr.append(board[y][x])
            board[y][x] = 0
        }
    }
    
    board[n-1] = arr
}

func roll(_ map: [[Int]], _ dir: Int) -> [[Int]] {
    if dir == 0 { return map }

    var result = [[Int]](repeating: [Int](repeating: 0, count: map.count), count: map[0].count)
    
    for i in 0..<map[0].count {
        for j in 0..<map.count {
            result[i][j] = map[map.count - j - 1][i]
        }
    }
    return roll(result, dir-1)
}

func halfLevitationAndRoll() {
    let half = [Array(board[n-1][0..<n/2])]
    (0..<n/2).forEach { board[n-1][$0] = 0 }
    let result = roll(half, 2)
    for x in n/2..<n {
        board[n-2][x] = result[0][x - n/2]
    }

    var two = [[Int]]()
    
    for j in n-2...n-1 {
        var row = [Int]()
        for i in n/2..<(n/2 + n/4) {
            row.append(board[j][i])
            board[j][i] = 0
        }
        two.append(row)
    }
    
    let result2 = roll(two, 2)
    for y in 0..<result2.count {
        for x in 0..<result2[0].count {
            board[n-4 + y][x + n/2 + n/4] = result2[y][x]
        }
    }
}