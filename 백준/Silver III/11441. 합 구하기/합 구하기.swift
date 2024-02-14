import Foundation

let n = Int(readLine()!)!

var a = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
let m = Int(readLine()!)!

for i in 1..<n+1 {
    a[i] += a[i-1]
}

for _ in 0..<m {
    let ij = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (i, j) = (ij[0], ij[1])

    print(a[j] - a[i-1])
}