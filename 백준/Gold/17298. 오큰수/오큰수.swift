import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var stack = [[Int]]() // i, num
var answer = Array(repeating: -1, count: n)

for i in 0..<n {
    let num = arr[i]

    if stack.isEmpty {
        stack.append([i, num])
    } else {

        if num > stack.last![1] {
            var maxVal = num

            while !stack.isEmpty && stack.last![1] < maxVal {
                answer[stack.last![0]] = maxVal
                maxVal = max(maxVal, stack.last![1])
                stack.removeLast()
            }
        }

        stack.append([i, num])
    }

}

print(answer.map { String($0) }.joined(separator: " "))