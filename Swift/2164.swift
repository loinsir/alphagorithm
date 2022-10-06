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

let N = Int(readLine()!)!
var queue = Queue()

for i in 1...N {
    queue.enqueue(i)
}

for i in 1...N {
    if queue.size == 1 {
        print(queue.first!)
        break
    }
    queue.dequeue()
    queue.enqueue(queue.dequeue()!)
}