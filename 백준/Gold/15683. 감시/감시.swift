import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var cctvs = [[Int]]()
var board1 = [[Int]]()
for i in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    board1.append(row)
    
    for j in 0..<m {
        if row[j] != 0 && row[j] != 6 {
            cctvs.append([i, j])
        }
    } 
}

var board2 = Array(repeating: Array(repeating: 0, count: m), count: n)

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

func upd(_ x: Int, _ y: Int, _ dir: Int) {
    var dir = dir % 4
    var x = x, y = y
    while true {
        x += dx[dir]
        y += dy[dir]
        if x < 0 || x >= n || y < 0 || y >= m || board2[x][y] == 6 { // 범위 초과, 혹은 벽을 만났을때
            return
        }
        if board2[x][y] != 0 { continue } // CCTV를 만났을때
        board2[x][y] = 7 // 감시 구간 표시
    }
}

var answer = Int.max
for tmp in 0..<Int(pow(4.0, Float(cctvs.count))) { // 0 ~ 4^cctv사이즈 승 만큼 반복
    
    for i in 0..<n { // 복사
        for j in 0..<m {
            board2[i][j] = board1[i][j]
        }
    }
    
    var brute = tmp
    for i in 0..<cctvs.count {
        let dir = brute % 4
        brute /= 4
        
        let x = cctvs[i][0], y = cctvs[i][1]
        
        if board1[x][y] == 1 {
            upd(x, y, dir)
        } else if board1[x][y] == 2 {
            upd(x, y, dir)
            upd(x, y, dir+2)
        } else if board1[x][y] == 3 {
            upd(x, y, dir)
            upd(x, y, dir+1)
        } else if board1[x][y] == 4 {
            upd(x, y, dir)
            upd(x, y, dir+1)
            upd(x, y, dir+2)
        } else { // 5
            upd(x, y, dir)
            upd(x, y, dir+1)
            upd(x, y, dir+2)
            upd(x, y, dir+3)
        }
    }
    
    var val = 0
    for i in 0..<n {
        for j in 0..<m {
            if board2[i][j] == 0 {
                val += 1
            }
        }
    }

    answer = min(val, answer)
}

print(answer)