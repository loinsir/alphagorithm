let input = readLine()!.split(separator: " ").map { Int($0)! }
let blocks = readLine()!.split(separator: " ").map { Int($0)! }

var leftMax = [Int](repeating: 0, count: blocks.count)
var rightMax = [Int](repeating: 0, count: blocks.count)
leftMax[0] = blocks.first!
rightMax[rightMax.count - 1] = blocks.last!

for i in 1..<blocks.count {
    leftMax[i] = max(leftMax[i - 1], blocks[i])
}

for i in stride(from: blocks.count-2, to: 0, by: -1) {
    rightMax[i] = max(rightMax[i + 1], blocks[i])
}

var result = 0
for i in 1..<blocks.count - 1 {
    result += min(leftMax[i], rightMax[i]) - blocks[i]
}

print(result)