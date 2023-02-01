import Foundation

let N = Int(readLine()!)!
var distances = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)

for i in 1...N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 1...input.count {
        distances[i][j] = input[j-1]
    }
}

for i in 1...N {
    for j in 1...N {
        for k in 1...N {
            if distances[j][i] + distances[i][k] == 2 || distances[j][k] == 1 {
                distances[j][k] = 1
            } else {
                distances[j][k] = 0
            }
        }
    }
}

for i in 1...N {
    print(distances[i][1...].map{String($0)}.joined(separator: " "))
}
