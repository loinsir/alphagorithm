import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
var map = [[Int]]()

let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
var posY = input2[0], posX = input2[1], dir = input2[2]

for i in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(row)
}

var answer = 0
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

func isValidPos(_ y: Int, _ x: Int) -> Bool {
    return 0..<n ~= y && 0..<m ~= x
}

while true {
    if map[posY][posX] == 0 { // 현재 칸 청소
        map[posY][posX] = 2
        answer += 1
    }
    
    var check = false
    for i in 0..<4 {
        let ny = dy[i] + posY
        let nx = dx[i] + posX
        if isValidPos(ny, nx) && map[ny][nx] == 0 {
            check = true
            break
        }
    }
    
    if check { // 청소되지 않은 빈칸 존재

        dir -= 1
        if dir == -1 {
            dir = 3
        }
        var ny = posY, nx = posX
        if dir == 0 {
            ny = max(ny - 1, 0)
        } else if dir == 1 {
            nx = min(nx + 1, m)
        } else if dir == 2 {
            ny = min(ny + 1, n)
        } else if dir == 3 {
            nx = max(nx - 1, 0)
        }
        
        if 1..<n-1 ~= ny && 1..<m-1 ~= nx && map[ny][nx] == 0 {
            posY = ny
            posX = nx
        }
        
    } else { // 전부 청소된 경우
        if dir == 0 {
            posY = min(posY+1, n-1)
        } else if dir == 1 {
            posX = max(0, posX-1)
        } else if dir == 2 {
            posY = max(0, posY-1)
        } else if dir == 3 {
            posX = min(posX+1, m-1)
        }
        
        if map[posY][posX] == 1 {
            break
        }
    }
}

print(answer)