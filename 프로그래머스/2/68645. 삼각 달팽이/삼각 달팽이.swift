import Foundation

var answer = [Int]()

let dy = [1, 0, -1]
let dx = [0, 1, -1]

func solution(_ n:Int) -> [Int] {
    if n == 1 {
        return [1]
    } else if n == 2 {
        return [1, 2, 3]
    } else {
        var dp = [1, 3]
        
        for i in 3...n {
            dp.append(dp[i-2] + i)
        }
        var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var mode = 0
        var num = 1
        var y = -1, x = 0
        while num <= dp.last! {
            let nextY = y + dy[mode], nextX = x + dx[mode]

            guard 0..<n ~= nextY && 0..<n ~= nextX && map[nextY][nextX] == 0 else {
                mode += 1
                mode %= 3
                continue
            }

            y = nextY
            x = nextX
            map[nextY][nextX] = num
            num += 1
        }

        return map.flatMap { $0 }.filter { $0 != 0 }
    }
}