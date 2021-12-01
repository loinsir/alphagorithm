import Foundation

let N: Int = Int(readLine()!)!

var matrices: [[Int]] = [[0, 0]]
for _ in 1...N {
    var matrix: [Int] = readLine()!.components(separatedBy: " ").map({Int($0)!})
    matrices.append(matrix)
}

var C: [[Int]] = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)

for L in 1...N-1 {
    for i in 1...N-L {
        var j = i + L
        C[i][j] = Int.max
        for k in i...j-1 {
            var temp = C[i][k] + C[k+1][j] + matrices[i][0]*matrices[k][1]*matrices[j][1]
            if temp < C[i][j] {
                C[i][j] = temp
            }
        }
    }
}

print(C[1][N])