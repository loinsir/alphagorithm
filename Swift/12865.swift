import Foundation

let input = readLine()!.components(separatedBy: " ").map({Int($0)!})
let N = input[0]
let C = input[1]

var things: [[Int]] = [[0, 0]]

for _ in 1...N {
    things.append(readLine()!.components(separatedBy: " ").map({Int($0)!}))
}

var K: [[Int]] = Array(repeating: Array(repeating: Int.max, count: C+1), count: N+1)

for i in 0...N {
    K[i][0] = 0
}

for w in 0...C {
    K[0][w] = 0
}

for i in 1...N {
    for w in 1...C {
        if things[i][0] > w {
            K[i][w] = K[i-1][w]
        } else {
            K[i][w] = [K[i-1][w], K[i-1][w-things[i][0]]+things[i][1]].max()!
        }
    }
}

print(K[N][C])