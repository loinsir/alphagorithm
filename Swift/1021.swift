import Foundation

let line = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let N = line[0], M = line[1]

var targets = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
var count = 0
var queue = Array(1...N)

targets.forEach { find($0) }
print(count)

func find(_ x: Int) {
    var leftCount = 0
    var rightCount = 0

    for i in 0..<queue.count {
        if queue[i] == x {
            leftCount = i
            rightCount = queue.count - i
            break
        }
    }

    if leftCount < rightCount {
        for _ in 0..<leftCount {
            queue.append(queue.removeFirst())
        }
        count += leftCount
    } else {
        for _ in 0..<rightCount {
            queue.insert(queue.removeLast(), at: 0)
        }
        count += rightCount
    }
    queue.removeFirst()
}