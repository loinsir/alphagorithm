import Foundation

let N = Int(readLine()!)!
let coins: [Int] = [5, 2]

var C = Array(repeating: 100000, count: N+1)
C[0] = 0

for j in 1...N {
    for coin in coins {
        if (coin <= j) && (C[j-coin] + 1 < C[j]) {
            C[j] = C[j-coin] + 1
        }
    }
}
if C[N] != 100000 {
    print(C[N])
} else {
    print(-1)
}