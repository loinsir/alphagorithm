import Foundation

while true {
    let line = readLine()!
    if line == "." {
        break
    }
    var stack: [Character] = []
    var error = false
    for char in line {
        if char == "(" || char == "[" {
            stack.append(char)
        } else if char == ")" {
            if let top = stack.last, top == "(" {
                stack.popLast()
            } else {
                print("no")
                error = true
                break
            }
        } else if char == "]" {
            if let top = stack.last, top == "[" {
                stack.popLast()
            } else {
                print("no")
                error = true
                break
            }
        } else if char == "." {
            break
        }
    }

    if error {
        continue
    }

    if stack.isEmpty {
        print("yes")
    } else {
        print("no")
    }
}