import Foundation

func solution(_ s:String) -> Int {
    var arr = Array(s + s).map { String($0) }
    var answer = 0
    
    for i in 0..<arr.count / 2 {
        if check(Array(arr[i..<i+(s.count)])) {
            answer += 1
        }
    }
    
    return answer
}

func check(_ arr: [String]) -> Bool {
    var stack = [String]()
    
    for i in 0..<arr.count {
        if stack.isEmpty {
            stack.append(arr[i])
        } else if stack.last! == "[" && arr[i] == "]" 
        || stack.last! == "(" && arr[i] == ")"
        || stack.last! == "{" && arr[i] == "}" {
            stack.popLast()
        } else {
            stack.append(arr[i])
        }
    }
    
    return stack.isEmpty
}