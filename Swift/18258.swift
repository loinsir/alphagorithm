import Foundation

// 라이노님의 빠른 입출력 코드 (사용하지 않으면 시간 초과 오류)
final class FileIO {
  private let buffer:[UInt8]
  private var index: Int = 0
  
  init(fileHandle: FileHandle = FileHandle.standardInput) {
    buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
  }
  
  @inline(__always) private func read() -> UInt8 {
    defer { index += 1 }
    
    return buffer[index]
  }
  
  @inline(__always) func readInt() -> Int {
    var sum = 0
    var now = read()
    var isPositive = true
    
    while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
    if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
    while now >= 48, now <= 57 {
      sum = sum * 10 + Int(now-48)
      now = read()
    }
    
    return sum * (isPositive ? 1:-1)
  }
  
  @inline(__always) func readString() -> Int {
    var str = 0
    var now = read()
    
    while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
    
    while now != 10,
          now != 32,
          now != 0 {
      str += Int(now)
      now = read()
    }
    
    return str
  }
}

// double stack queue
struct Queue {
    var leftStack: [Int] = []
    var rightStack: [Int] = []

    var count: Int {
        leftStack.count + rightStack.count
    }

    var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }

    var first: Int? {
        guard !isEmpty else { return -1 }
        return rightStack.isEmpty ? leftStack.first : rightStack.last
    }

    var last: Int? {
        guard !isEmpty else { return -1 }
        return leftStack.isEmpty ? rightStack.first : leftStack.last
    }

    mutating func enqueue(_ element: Int) {
        leftStack.append(element)
    }

    mutating func dequeue() -> Int? {
        guard !isEmpty else { return -1 }

        if rightStack.isEmpty {
            rightStack = leftStack.reversed()
            leftStack.removeAll()
        }

        return rightStack.popLast()
    }
}

let reader = FileIO()
var queue = Queue()
var result = ""

for _ in 0..<reader.readInt() {
    let command = reader.readString()

    if command == 448 {
        queue.enqueue(reader.readInt())
    } else if command == 335 {
        result += queue.isEmpty ? "-1\n" : "\(queue.dequeue()!)\n"
    } else if command == 443 {
        result += "\(queue.count)\n"
    } else if command == 559 {
        result += queue.isEmpty ? "1\n" : "0\n"
    } else if command == 553 {
        result += "\(queue.first!)\n"
    } else if command == 401 {
        result += "\(queue.last!)\n"
    }
}
print(result)