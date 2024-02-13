import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
let h = readLine()!.split(separator: " ").map { Int(String($0))! }

var weights = [Int](repeating: 0, count: n+1)

for _ in 0..<m {
    let abk = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b, k) = (abk[0], abk[1], abk[2])
    weights[a-1] += k
    weights[b] -= k
}

for i in 1..<n {
    weights[i] += weights[i-1]
}

for i in 0..<n {
    weights[i] += h[i]
}

print(weights[0..<n].map { String($0) }.joined(separator: " "))