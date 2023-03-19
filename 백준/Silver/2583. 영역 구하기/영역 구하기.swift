import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))!}
let M = input[0], N = input[1], K = input[2]

var board = Array(repeating: Array(repeating: 0, count: N), count: M)

for _ in 1...K {
    let num = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let minX = num[0], minY = num[1], maxX = num[2] - 1, maxY = num[3] - 1

    for x in minX...maxX {
        for y in minY...maxY {
            board[y][x] = 1
        }
    }
}

let dx =  [0, 0, -1, 1], dy = [-1 ,1 , 0 , 0]
var answer = [Int]()
var count = 0

func dfs(_ x: Int, _ y: Int) {
    for i in 0..<dx.count {
        let xPos = x + dx[i]
        let yPos = y + dy[i]

        if xPos < 0 || yPos < 0 || xPos > M - 1 || yPos > N - 1 {
            continue
        } else {
            if board[xPos][yPos] == 0 {
                board[xPos][yPos] = 1
                count += 1
                dfs(xPos, yPos)
            }
        }
    }
}

for x in 0..<M {
    for y in 0..<N {
        if board[x][y] == 0 {
            board[x][y] = 1
            count += 1
            dfs(x, y)
            answer.append(count)
            count = 0
        }
    }
}

answer.sort()
print(answer.count)
print(answer.map { String($0) }.joined(separator: " "))