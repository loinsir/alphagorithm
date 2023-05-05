import Foundation

let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (b, c) = (input[0], input[1])

var answer = 0

for i in 0..<n {
    var students = a[i]
    var tmp = 0
    students -= b

    if students > 0 {
        tmp = students / c
        students = students % c
        if students > 0 {
            tmp += 1
        }
    }
    answer += tmp + 1
}

print(answer)