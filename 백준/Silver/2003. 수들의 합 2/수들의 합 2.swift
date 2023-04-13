let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var size = 1
var answer = 0
while size <= arr.count {
    
    var sum = 0
    for i in 0..<size {
        sum += arr[i]
    }

    if sum == m {
        answer += 1
    }
    
    var start = 0
    var end = size - 1
    
    while end < arr.count-1 {
        sum -= arr[start]
        start += 1
        
        end += 1
        sum += arr[end]
        
        if sum == m {
            answer += 1
        }
    }
    
    size += 1
}

print(answer)