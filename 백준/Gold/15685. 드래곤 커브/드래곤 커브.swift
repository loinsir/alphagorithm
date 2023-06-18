import Foundation

let n = Int(readLine()!)!

var map = Array(repeating: Array(repeating: " ", count: 101), count: 101)
var answer = 0

let dy = [1, 0, -1 ,0], dx = [0, -1, 0, 1]

func dragon(_ x: Int, _ y: Int, _ dir: Int, _ gen: Int) {
    var gen = gen
    var direction = [dir]

    while gen > 0 {
        var temp = direction
        for _ in 0..<temp.count {
            var nextDir = temp.removeLast()
            nextDir = nextDir == 3 ? 0 : nextDir + 1
            direction.append(nextDir)
        }
        gen -= 1
    }

    map[x][y] = "D"
    var point = (x, y)
    for dir in direction {
        point.0 += dx[dir]
        point.1 += dy[dir]
        map[point.0][point.1] = "D"
    }
}

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    dragon(input[1], input[0], input[2], input[3])
}

for i in 0..<100 {
    for k in 0..<100 {
        if map[i][k] == "D" && map[i+1][k] == "D" && map[i][k+1] == "D" && map[i+1][k+1] == "D" {
            answer += 1
        }
    }
}
print(answer)