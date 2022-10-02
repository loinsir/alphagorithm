import Foundation

let K = Int(readLine()!)!

var stack: [Int] = []

for _ in 1...K {
    let number = Int(readLine()!)!

    if number == 0 {
        stack.popLast()
    } else {
        stack.append(number)
    }
}

let sum = stack.reduce(0) { $0 + $1 }

print(sum)