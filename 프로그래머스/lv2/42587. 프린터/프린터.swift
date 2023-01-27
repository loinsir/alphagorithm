import Foundation

struct Queue {
    private var left = [(Int,Int)]()
    private var right = [(Int,Int)]()
    
    var isEmpty: Bool {
        left.isEmpty && right.isEmpty
    }
    
    mutating func dequeue() -> (Int, Int)? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
    
    mutating func enqueue(_ element: (Int, Int)) {
        right.append(element)
    }
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var q = Queue()
    var count = 0
    
    for (location, priority) in priorities.enumerated() {
        q.enqueue((location,priority))
    }
    
    var priorityList = priorities.sorted(by: <)
    while let element = q.dequeue() {
        if element.1 == priorityList.last! {
            priorityList.removeLast()
            count += 1
            
            if element.0 == location {
                break
            }
        } else {
            q.enqueue(element)
        }
    }
    
    
    return count
}