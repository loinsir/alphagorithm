import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])

let arr = readLine()!.components(separatedBy: " ").map { Int($0)! }
var l = 0, r = k - 1
var sum = Array(arr[l...r]).reduce(0, +)
var rangeSums = [Int](repeating: 0, count: n - k + 1)
rangeSums[0] = sum

for i in 1..<rangeSums.count {
    r += 1
    sum += arr[r]
    sum -= arr[l]
    l += 1
    rangeSums[i] = sum
}

print(rangeSums.max()!)