import Foundation

var stack = [Int]()
var input = [Int]()
var result = [String]()
var error = false

let n = Int(readLine()!)!

for _ in 1...n {
    input.append(Int(readLine()!)!)
}

var index = 0
var num = 1

for a in input {

    while num <= a {
        stack.append(num)
        result.append("+")
        num += 1
    }

    if let top = stack.last, top == a {
        stack.popLast()
        result.append("-")
    } else {
        error = true
        break
    }
}

if error {
    print("NO")
} else {
    for char in result {
        print(char)
    }
}