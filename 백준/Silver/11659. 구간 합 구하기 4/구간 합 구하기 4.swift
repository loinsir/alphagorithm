let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var acc = [0]
var sum = 0
for i in 0..<arr.count {
    sum += arr[i]
    acc.append(sum)
}

for _ in 0..<M {
    let cmd = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (i, j) = (cmd[0], cmd[1])
    
    print(acc[j] - acc[i-1])
    
}