import Foundation
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var a = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    a.append(row)
}

let dy = [0, -1, -1, -1, 0, 1, 1, 1], dx = [-1, -1, 0, 1, 1, 1, 0, -1]
let by = [-1, 1, 1, -1], bx = [-1, -1, 1, 1]
var clouds = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
clouds[n-1][0] = true
clouds[n-1][1] = true
clouds[n-2][0] = true
clouds[n-2][1] = true

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }

    let (d, s) = (input[0] - 1, input[1])
    var increased = [[Int]]()
    
    for i in 0..<n {
        for j in 0..<n {
            if clouds[i][j] {
                var ny = i + dy[d] * s, nx = j + dx[d] * s

                if ny >= n {
                    ny = ny % n
                } else if ny < 0 {
                    while ny < 0 {
                        ny += n
                    }
                }

                if nx >= n {
                    nx  = nx % n
                } else if nx < 0 {
                    while nx < 0 {
                        nx += n
                    }
                }

                a[ny][nx] += 1
                clouds[i][j] = false
                increased.append([ny, nx])
            }
        }
    }

    for i in 0..<increased.count {
        let y = increased[i][0]
        let x = increased[i][1]

        for j in 0..<4 {
            let posY = y + by[j], posX = x + bx[j]

            if 0..<n ~= posY && 0..<n ~= posX && a[posY][posX] > 0 {
                a[y][x] += 1
            }
        }
    }

    for i in 0..<n {
        for j in 0..<n {
            if a[i][j] >= 2 && !increased.contains([i, j]) {
                clouds[i][j] = true
                a[i][j] -= 2
            }
        }
    }
}

var answer = 0
for i in 0..<n {
    for j in 0..<n {
        answer += a[i][j] 
    }
}
print(answer)