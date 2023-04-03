import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

var trees = readLine()!.split(separator: " ").map { Int(String($0))! }
trees.sort(by: < )

var start = 0, end = trees.last!

while start <= end {
    var sum = 0
    let mid = (start + end) / 2
    for i in trees {
        if i - mid < 0 {
            continue
        } else {
            sum += i - mid
        }
    }
    if sum < M {
        end = mid - 1
    } else {
        start = mid + 1
    }
}

print(start - 1)