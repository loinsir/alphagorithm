import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var arr = [Int]()
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
arr.sort()
var answer = Int.max
var left = 0, right = 0

while left <= right && right < n {
    if arr[right] - arr[left] < m {
        right += 1
    } else {
        answer = min(answer, arr[right] - arr[left])
        left += 1
    }
}

print(answer)