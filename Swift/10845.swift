import Foundation // String.contains에서 필요함
struct Queue {
    private var left: [Int] = []
    private var right: [Int] = []

    var isEmpty: Bool {
        left.isEmpty && right.isEmpty
    }

    var size: Int {
        left.count + right.count
    }

    var front: Int? {
        if left.isEmpty {
            return right.first
        }
        return left.last
    }

    var back: Int? {
        if !right.isEmpty {
            return right.last
        }
        return left.first 
    }

    mutating func push(_ value: Int) {
        right.append(value)
    }

    mutating func pop() -> Int? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }

}

let N = Int(readLine()!)!
var queue = Queue()
for _ in 1...N {
    let input = readLine()!.split(separator: " ").map{ String($0) }

    if input[0].contains("push") {
        let val = Int(input[1])!
        queue.push(val)
    } else if input[0].contains("pop") {
        if let pop = queue.pop() {
            print(pop)
        } else {
            print(-1)
        }
    } else if input[0].contains("size") {
        print(queue.size)
    } else if input[0].contains("empty") {
        if queue.isEmpty {
            print(1)
        } else {
            print(0)
        }
    } else if input[0].contains("front") {
        if let front = queue.front {
            print(front)
        } else {
            print(-1)
        }
    } else if input[0].contains("back") {
        if let last = queue.back {
            print(last)
        } else {
            print(-1)
        }
    }
}