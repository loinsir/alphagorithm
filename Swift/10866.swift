import Foundation

let N = Int(readLine()!)!

struct Deque {
    private var left = [Int]()
    private var right = [Int]()

    var size: Int {
        left.count + right.count
    }

    var empty: Bool {
        left.isEmpty && right.isEmpty
    }

    var front: Int? {
        left.isEmpty ? right.first : left.last
    }

    var back: Int? {
        right.isEmpty ? left.first : right.last
    }

    mutating func pushLeft(_ value: Int) {
        left.append(value)
    }

    mutating func pushRight(_ value: Int) {
        right.append(value)
    }

    mutating func popLeft() -> Int? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }

    mutating func popRight() -> Int? {
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        return right.popLast()
    }
}

var deque = Deque()

for _ in 1...N {
    let line = readLine()!.components(separatedBy: " ")

    if line[0].contains("push_front") {
        let number = Int(line[1])!
        deque.pushLeft(number)
    } else if line[0].contains("push_back") {
        let number = Int(line[1])!
        deque.pushRight(number)
    } else if line[0].contains("pop_front") {
        deque.empty ? print(-1) : print(deque.popLeft()!)
    } else if line[0].contains("pop_back") {
        deque.empty ? print(-1) : print(deque.popRight()!)
    } else if line[0].contains("size") {
        print(deque.size)
    } else if line[0].contains("empty") {
        deque.empty ? print(1) : print(0)
    } else if line[0].contains("front") {
        deque.empty ? print(-1) : print(deque.front!)
    } else if line[0].contains("back") {
        deque.empty ? print(-1) : print(deque.back!)
    }
}