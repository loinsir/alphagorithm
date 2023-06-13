import Foundation
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = 0, s = arr.max()!, e = arr.reduce(0, +)

while s < e {
    let mid = (s + e) / 2

    var count = 1
    var tmp = 0
    for i in 0..<arr.count {
        if tmp + arr[i] <= mid {
            tmp += arr[i]
        } else {
            count += 1
            tmp = arr[i]
        }
    }
    
    if count <= m {
        e = mid
    } else {
        s = mid + 1
    }
    answer = e
}
print(answer)