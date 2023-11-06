import Foundation

let t = Int(readLine()!)!
var cache = [[Int]](repeating: [Int](repeating: 0, count: 31), count: 31)

for i in 0...30 {
    for j in 0...i {
        if i == j || j == 0 {
            cache[i][j] = 1
            continue
        }
        cache[i][j] = cache[i - 1][j - 1] + cache[i - 1][j]
    }
}

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0], m = input[1]
    print(cache[m][n])
}