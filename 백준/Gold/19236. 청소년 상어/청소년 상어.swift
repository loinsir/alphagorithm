import Foundation

let dy = [-1, -1, 0, 1, 1, 1, 0, -1]
let dx = [0, -1, -1, -1, 0, 1, 1, 1]

var map = [[[Int]]]()

for i in 0..<4 {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    var row = [[Int]]()
    for j in 0..<4 {
        row.append([input[j * 2], input[j * 2 + 1] - 1])
    }
    map.append(row)
}

func fishMove(_ sharkY: Int, _ sharkX: Int, _ board: [[[Int]]]) -> [[[Int]]] {
    var board = board
    
    for i in 1...16 {
        var check = false
        for y in 0..<4 {
            for x in 0..<4 {
                if board[y][x][0] == i {
                    var dir = board[y][x][1]
                    var ny = y + dy[dir], nx = x + dx[dir]
                    var count = 0

                    while (!(0..<4 ~= ny && 0..<4 ~= nx) || (ny == sharkY && nx == sharkX)) && count < 8 {
                        dir = (dir + 1) % 8
                        ny = y + dy[dir]
                        nx = x + dx[dir]
                        count += 1
                    }

                    if count < 8 {
                        var tmp = board[ny][nx]
                        board[ny][nx] = [board[y][x][0], dir]
                        board[y][x] = tmp
                    }
                    check = true
                }
                if check { break }
            }
            if check { break }
        }
    }
    return board
}

var answer = 0
func dfs(_ sharkY: Int, _ sharkX: Int, _ score: Int, _ board: [[[Int]]]) {
    answer = max(answer, score)
    var board = fishMove(sharkY, sharkX, board)

    var sharkDir = board[sharkY][sharkX][1]
    var candidates = [[Int]]()
    var ny = sharkY + dy[sharkDir], nx = sharkX + dx[sharkDir]
    while 0..<4 ~= ny && 0..<4 ~= nx {
        if board[ny][nx][0] != -1 {
            candidates.append([ny, nx])
        }
        ny += dy[sharkDir]
        nx += dx[sharkDir]
    }

    for i in 0..<candidates.count {
        let y = candidates[i][0], x = candidates[i][1]
        let eat = board[y][x][0]
        board[y][x][0] = -1
        dfs(y, x, score + eat, board)
        board[y][x][0] = eat
    }
}

let initScore = map[0][0][0]
map[0][0][0] = -1
dfs(0, 0, initScore, map)
print(answer)