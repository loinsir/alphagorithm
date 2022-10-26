let N = Int(readLine()!)!

struct Queue {
    private var left: [Int] = []
    private var right: [Int] = []

    var isEmpty: Bool {
        left.isEmpty && right.isEmpty
    }

    var size: Int {
        left.count + right.count
    }

    mutating func enqueue(_ element: Int) {
        if size >= N {
            return
        }
        right.append(element)
    }

    mutating func dequeue() -> Int? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }

    func printQueue() {
        for i in left.reversed() {
            print(i, separator: " ", terminator: " ")
        }

        for i in right {
            print(i, separator: " ", terminator: " ")
        }
    }
}

var q = Queue()

while true {
    let input = Int(readLine()!)!

    if input == 0 {
        q.dequeue()
    } else if input == -1 {
        if q.isEmpty {
            print("empty")
        } else {
            q.printQueue()
        }
        break
    } else {
        q.enqueue(input)
    }
}