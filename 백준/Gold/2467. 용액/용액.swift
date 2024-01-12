import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var left = 0, right = n - 1
var answer = [Int]()

var ph = Int.max

while left < right {
    if arr[left] + arr[right] == 0 {
        answer = [arr[left], arr[right]]
        break
    }

    if ph > abs(arr[left] + arr[right]) {
        ph = abs(arr[left] + arr[right])
        answer = [arr[left], arr[right]]
    }

    if arr[left] + arr[right] < 0 {
        left += 1
    } else {
        right -= 1
    }
}

print(answer[0], answer[1])