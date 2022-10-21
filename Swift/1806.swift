import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], S = input[1]

let seq = readLine()!.split(separator: " ").map { Int(String($0))! }

var end = 0
var count = 0

var result = Int.max

var sum = 0
for start in 0..<N {
    while sum < S && end < N {
        sum += seq[end]
        end += 1
        count += 1
    } 

    if sum >= S {
        result = min(result, count)
    }
    sum -= seq[start]
    count -= 1
}

print(result == Int.max ? 0 : result)