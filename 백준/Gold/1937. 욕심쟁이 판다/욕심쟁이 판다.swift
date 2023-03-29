import Foundation

let n = Int(readLine()!)!

let dydx = [(0, 1), (0, -1), (1, 0), (-1, 0)]
var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
var table = [[Int]]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    table.append(input)
}

func dfs(_ y: Int, _ x: Int) -> Int {
    
    if dp[y][x] != 0 {
        return dp[y][x]
    }
    dp[y][x] = 1

    for d in dydx {
        let nextY = y+d.0, nextX = x+d.1
        
        if nextY < 0 || nextY >= n || nextX < 0 || nextX >= n {
            continue
        }
        
        if table[nextY][nextX] > table[y][x] {
            dp[y][x] = max(dp[y][x], 1 + dfs(nextY, nextX))
        }
    }
    
    return dp[y][x]
}
var answer = 0
for i in 0..<n {
    for j in 0..<n {
        answer = max(answer, dfs(i, j))
    }
}
print(answer)