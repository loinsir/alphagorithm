import Foundation

let count = Int(readLine()!)!

var farmW = 0, farmH = 0
var farm: [[Bool]] = []

let dx: [Int] = [0, 0, -1, 1]
let dy: [Int] = [-1, 1, 0, 0]

for _ in 0..<count {
    //input
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    farmW = input[0]
    farmH = input[1]
    let cabbageCount = input[2]
    
    farm = Array(repeating: Array(repeating: false, count: farmW), count: farmH)
    for _ in 0..<cabbageCount {
        let positions = readLine()!.split(separator: " ").map { Int(String($0))! }
    
        farm[positions[1]][positions[0]] = true
    }
    
    var count = 0
    for y in 0..<farmH {
        for x in 0..<farmW {
            if farm[y][x] {
                dfs(y: y, x: x)
                count += 1
            }
        }
    }
    
    print(count)
}

func dfs(y: Int, x: Int) {
    if farm[y][x] {
        farm[y][x] = false
        
        for i in 0..<4 {
            let nextY = y + dy[i], nextX = x + dx[i]
            if nextY >= 0 && nextY < farmH && nextX >= 0 && nextX < farmW {
                if farm[y+dy[i]][x+dx[i]] {
                    dfs(y: y+dy[i], x: x+dx[i])
                }
            }
        }
    }
}