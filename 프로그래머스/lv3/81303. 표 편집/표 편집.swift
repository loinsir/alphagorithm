import Foundation

class Node {
    var prev: Node?
    var next: Node?
    var idx = 0
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var node = Node()
    var index = node
    for i in 0..<n-1 {
        node.next = Node()
        node.next!.prev = node
        node = node.next!
        node.idx = i+1
        if k == i+1 {
            index = node
        }
    }
    
    var deleted = [Node]()
    var answer = Array(repeating: "O", count: n)
    
    for i in 0..<cmd.count {
        let command = cmd[i]
        
        if command.hasPrefix("U") {
            let input = command.split(separator: " ").map { String($0) }
            let x = Int(input[1])!
            for _ in 0..<x {
                index = index.prev!
            }

        } else if command.hasPrefix("D") {
            let input = command.split(separator: " ").map { String($0) }
            let x = Int(input[1])!
            for _ in 0..<x {
                index = index.next!
            }
        } else if command.hasPrefix("C") {
            index.prev?.next = index.next
            index.next?.prev = index.prev
            deleted.append(index)
            answer[index.idx] = "X"
            if index.next == nil {
                index = index.prev!
            } else {
                index = index.next!
            }
        } else if command.hasPrefix("Z") {
            let ele = deleted.removeLast()
            ele.prev?.next = ele
            ele.next?.prev = ele
            answer[ele.idx] = "O"
        }
    }
    
    return answer.joined()
}