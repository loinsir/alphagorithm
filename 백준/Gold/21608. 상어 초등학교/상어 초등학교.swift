import Foundation

let n = Int(readLine()!)!
let dy = [1, 0, -1, 0], dx = [0, 1, 0, -1]

var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

var table = [[Int]]()
for _ in 0..<Int(pow(Float(n), 2.0)) {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    table.append(input)
}

for p in 0..<table.count {
    let num = table[p][0]
    let favorites = Array(table[p][1...4])


    var favoriteMap = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var emptyMap = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

    var maxVal = 0
    for i in 0..<n {
        for j in 0..<n {
            for k in 0..<4 {
                let y = dy[k] + i, x = dx[k] + j
                if 0..<n ~= y && 0..<n ~= x && map[i][j] == 0 {
                    if favorites.contains(map[y][x]) {
                        favoriteMap[i][j] += 1
                        maxVal = max(maxVal, favoriteMap[i][j])
                    }
                }
            }
        }
    }

    var first = [[Int]]()
    for i in 0..<n {
        for j in 0..<n {
            if maxVal == favoriteMap[i][j] && map[i][j] == 0 {
                first.append([i, j])
            }
        }
    }

    if first.count == 1 { // 1번 조건
        map[first[0][0]][first[0][1]] = num
    } else { // 2번 조건
        var second = [[Int]]()
        var maxEmpty = 0

        for i in 0..<first.count {
            for k in 0..<4 {
                let y = first[i][0] + dy[k], x = first[i][1] + dx[k]

                if 0..<n ~= y && 0..<n ~= x && map[y][x] == 0 {
                    emptyMap[first[i][0]][first[i][1]] += 1
                    maxEmpty = max(maxEmpty, emptyMap[first[i][0]][first[i][1]])
                }
            }
        }

        for i in 0..<first.count {
            if emptyMap[first[i][0]][first[i][1]] == maxEmpty && map[first[i][0]][first[i][1]] == 0 {
                second.append([first[i][0], first[i][1]])
            }
        }
        second.sort(by: { 
            if $0[0] == $1[0] {
                return $0[0] < $1[0]
            } else {
                return $0[1] < $1[1]
            }
        })
        map[second[0][0]][second[0][1]] = num
    }
}

var answer = 0

var scoreMap = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
for i in 0..<n {
    for j in 0..<n {

        
        for k in 0..<table.count {
            let num = table[k][0]
            let favorites = Array(table[k][1...4])

            if num == map[i][j] {
                for a in 0..<4 {
                    let y = i + dy[a], x = j + dx[a]

                    if 0..<n ~= y && 0..<n ~= x && favorites.contains(map[y][x]) {
                        scoreMap[i][j] += 1
                    }
                }
                break
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        switch scoreMap[i][j] {
            case 0: answer += 0
            case 1: answer += 1
            case 2: answer += 10
            case 3: answer += 100
            default: answer += 1000
        }
    }
}

print(answer)