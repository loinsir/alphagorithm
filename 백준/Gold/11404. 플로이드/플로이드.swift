import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var allDistances = Array(repeating: Array(repeating: Int.max, count: n+1), count: n+1)

for i in 1...n {
    allDistances[i][i] = 0
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    allDistances[input[0]][input[1]] = min(allDistances[input[0]][input[1]], input[2])
}

for i in 1...n {
    for j in 1...n {
        for k in 1...n {
            if allDistances[j][i] == Int.max || allDistances[i][k] == Int.max {
                continue
            }
            allDistances[j][k] = min(allDistances[j][k], allDistances[j][i] + allDistances[i][k])
        }
    }
}

for i in 1...n {
   print(allDistances[i][1...].map { String($0 == Int.max ? 0 : $0) }.joined(separator: " "))
}