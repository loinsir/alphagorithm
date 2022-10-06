import Foundation

struct Queue {
    private var leftStack: [Int] = []
    private var rightStack: [Int] = []

    var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }

    var size: Int {
        leftStack.count + rightStack.count
    }

    var first: Int? {
        if isEmpty {
            return -1
        } else {
            return leftStack.isEmpty ? rightStack.first : leftStack.last
        }
    }

    mutating func enqueue(_ element: Int) {
        rightStack.append(element)
    }

    mutating func dequeue() -> Int? {
        if isEmpty {
            return -1
        }

        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
}

let line = readLine()!.components(separatedBy: " ").map { Int($0)! }
let N = line[0]
let K = line[1]
var result: [Int] = []
var queue = Queue()

for i in 1...N {
    queue.enqueue(i)
}

for _ in 1...N {
    for i in 1...K {
        if i == K {
            result.append(queue.dequeue()!)
        } else {
            queue.enqueue(queue.dequeue()!)
        }
    }
}

let resultString = result.map { String($0) }.joined(separator: ", ")
print("<" + resultString + ">")