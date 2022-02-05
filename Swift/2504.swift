var input = readLine()!.map{ String($0) }
var stack: [String] = []

var isCorrect: Bool = true
var temp = 1
var result = 0

for i in input.indices {
    if input[i] == "(" {
        temp *= 2
        stack.append(input[i])
    } else if input[i] == "[" {
        temp *= 3
        stack.append(input[i])
    } else if input[i] == ")" {
        if stack.isEmpty || stack.last! != "(" {
            isCorrect = false
            break
        } else {
            if input[i-1] == "(" {
                result += temp
            }
            temp /= 2
            stack.removeLast()
        }
    } else if input[i] == "]" {
        if stack.isEmpty || stack.last! != "[" {
            isCorrect = false
            break
        } else {
            if input[i-1] == "[" {
                result += temp
            }
            temp /= 3
            stack.removeLast()
        }
    }
}

if !isCorrect || !stack.isEmpty {
    print(0)
} else {
    print(result)
}