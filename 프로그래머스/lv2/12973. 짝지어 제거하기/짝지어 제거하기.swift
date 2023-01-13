import Foundation

func solution(_ s:String) -> Int{
    var answer = 0
    var stack: [String] = []
    
    for i in s {
        if !stack.isEmpty {
            if stack.last! == String(i) {
                stack.popLast()!
            } else {
                stack.append(String(i))
            }
        } else {
            stack.append(String(i))
        }
    }

    return stack.isEmpty ? 1 : 0
}