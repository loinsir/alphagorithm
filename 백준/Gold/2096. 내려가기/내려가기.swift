import Foundation

let n = Int(readLine()!)!
var arr = [[Int]]()

for i in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(row)
}

var maxDP = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
var minDP = maxDP

for i in 0..<3 {
    maxDP[0][i] = arr[0][i]
    minDP[0][i] = arr[0][i]
}

for i in 1..<n {
    maxDP[i][0] = arr[i][0] + max(maxDP[i-1][0], maxDP[i-1][1])
    maxDP[i][1] = arr[i][1] + maxDP[i-1].max()!
    maxDP[i][2] = arr[i][2] + max(maxDP[i-1][1], maxDP[i-1][2])
    
    minDP[i][0] = arr[i][0] + min(minDP[i-1][0], minDP[i-1][1])
    minDP[i][1] = arr[i][1] + minDP[i-1].min()!
    minDP[i][2] = arr[i][2] + min(minDP[i-1][1], minDP[i-1][2])
}

print(maxDP[n-1].max()!, minDP[n-1].min()!)