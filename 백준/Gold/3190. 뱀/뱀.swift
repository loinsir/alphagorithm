import Foundation

let dy = [-1, 0, 1, 0], dx = [0, 1, 0, -1]

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for _ in 0..<k {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (y, x) = (row[0]-1, row[1]-1)
    map[y][x] = 1
}

let l = Int(readLine()!)!

var q = [[Int]]()
q.append([0, 0])
var idx = 0
var tailIdx = 0

var dirs = [[Int]]()
var dirIdx = 0
var dir = 1

for _ in 0..<l {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let x = Int(input[0])!
    let c = input[1]
    
    if c == "L" {
        dir -= 1
        if dir < 0 {
            dir += 4
        }
    } else {
        dir = (dir + 1) % 4
    }
    dirs.append([x, dir])
}

var time = 0
dir = 1
map[0][0] = -1
while true {
    let head = q[idx]
    let y = head[0], x = head[1]
    var currentDir = dir
    
    if dirIdx < dirs.count && dirs[dirIdx][0] == time {
        currentDir = dirs[dirIdx][1]
        dir = currentDir
        dirIdx += 1
    }
    
    let ny = y + dy[currentDir], nx = x + dx[currentDir]
    
    guard 0..<n ~= ny && 0..<n ~= nx && map[ny][nx] != -1 else {
        time += 1
        break
    }
    
    if map[ny][nx] == 0 {
        let tail = q[tailIdx]
        let tailY = tail[0], tailX = tail[1]
        map[tailY][tailX] = 0
        tailIdx += 1
    }
    
    map[ny][nx] = -1
    q.append([ny, nx])
    idx += 1
    time += 1
}

print(time)
