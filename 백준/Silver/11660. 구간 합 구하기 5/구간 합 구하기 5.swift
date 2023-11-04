let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var table: [[Int]] = [[Int](repeating: 0, count: n + 1)]
for _ in 0..<n {
    table.append([0] + readLine()!.split(separator: " ").map { Int($0)! })
}

for y in 1...n {
    for x in 1...n {
        table[y][x] += table[y - 1][x] + table[y][x - 1] - table[y - 1][x - 1]
    }
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let y1 = input[0], x1 = input[1], y2 = input[2], x2 = input[3]
    print(table[y2][x2] - table[y1 - 1][x2] - table[y2][x1 - 1] + table[y1 - 1][x1 - 1])
}