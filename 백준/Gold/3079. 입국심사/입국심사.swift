import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var t = [Int]()

for _ in 0..<n {
    let k = Int(readLine()!)!
    t.append(k)
}

t.sort()
var s = 1, e = t[0] * m, answer = 0

while s <= e {
    let mid = (s + e) / 2
    let count = t.map { mid / $0 }.reduce(0, +)
    if count >= m {
        e = mid - 1
        answer = mid
    } else {
        s = mid + 1
    }
}
print(answer)
