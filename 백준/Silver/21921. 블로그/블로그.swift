import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, x) = (input[0], input[1])

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var sum = 0
for i in 0..<x {
    sum += arr[i]
}

var start = 0
var end = x - 1
var answer = sum
var range = 1

while end < arr.count-1 {
    sum -= arr[start]
    start += 1

    end += 1
    sum += arr[end]

    if answer < sum {
        range = 1
    } else if answer == sum {
        range += 1
    }

    answer = max(answer, sum)
}

if answer == 0 {
    print("SAD")
} else {
    print(answer)
    print(range)
}

