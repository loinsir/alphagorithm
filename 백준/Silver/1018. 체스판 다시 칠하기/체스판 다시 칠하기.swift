import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var board = [[Int]]()

for _ in 0..<n {
    let row: [Int] = readLine()!.map {
        if $0 == "W" {
            return 1
        } else {
            return 0
        }
    }
    board.append(row)
}

var answer = Int.max


for i in 0...n-8 {
    for j in 0...m-8 {
        var changed = 0
        let starts = [[i, j], [i+7, j+7], [i+7, j], [i, j+7]]

        for pos in starts {
            let start = board[pos[0]][pos[1]]
            for k in i..<i+8 {
                for l in j..<j+8 {
                    if (k + l) % 2 == 0 && board[k][l] != start ||
                    (k + l) % 2 == 1 && board[k][l] == start {
                        changed += 1
                    }
                }
            }
            answer = min(changed, answer)
            changed = 0
        }
    }
}

print(answer)
