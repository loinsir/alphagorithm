import Foundation

let N = Int(readLine()!)!

var stack: [Int] = []

for _ in 1...N {
    let line = readLine()!

    if line.contains("push") {
        let number = Int(line.split(separator: " ").last!)!
        stack.append(number)
    } else if line.contains("pop") {
        if stack.isEmpty {
            print(-1)
        } else {
            print(stack.popLast()!)
        }
    } else if line.contains("size") {
        print(stack.count)
    } else if line.contains("empty") {
        if stack.isEmpty {
            print(1)
        } else {
            print(0)
        }
    } else if line.contains("top") {
        if stack.isEmpty {
            print(-1)
        } else {
            print(stack.last!)
        }
    }
}