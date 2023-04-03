import Foundation

var input = readLine()!
let bomb = readLine()!

var stack = [Character]()

for s in input {
    stack.append(s)
    
    if s == bomb.last! {
        let count = stack.count
        
        if count >= bomb.count && String(stack[(count-bomb.count)...]) == bomb {
            for _ in 0..<bomb.count {
                stack.popLast()
            }
        }
    }
}

print(stack.isEmpty ? "FRULA" : String(stack))