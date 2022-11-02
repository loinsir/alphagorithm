let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map { Int(String($0))! }

for i in 1..<n {
    input[i] = max(input[i], input[i] + input[i-1])
}

print(input.max()!)

// 살짝 꼬아서 dp... 핵심은 한 방향으로 탐색하면서, 만약 지금까지의 누적값보다 큰 값이 등장하게 되면
// 누적값을 버리고 그 값이 새로운 누적값이 된다는 것.