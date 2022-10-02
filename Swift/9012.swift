import Foundation

let T = Int(readLine()!)!

for _ in 1...T {
    let data = readLine()!
    var stack: [Character] = []
    var error = false

    for char in data {
        if char == "(" {
            stack.append(char)
        } else if char == ")" {
            if !stack.isEmpty {
                stack.popLast()
            } else {
                print("NO")
                error = true
                break
            }
        }
    }

    if error {
        continue
    }

    if stack.isEmpty {
        print("YES")
    } else {
        print("NO")
    }
}