import Foundation

struct NodePriority: Comparable {
    static func < (lhs: NodePriority, rhs: NodePriority) -> Bool {
        return lhs.priority < rhs.priority
    }
    
    var priority = 0
    var minerals = [String]()
    
    init(_ priority: Int, _ minerals: [String]) {
        self.priority = priority
        self.minerals = minerals
    }
}

class Heap<T: Comparable> {
    private var nodes: [T] = []
    private let sort: (T, T) -> Bool
    
    init(sort: @escaping ((T, T) -> Bool)) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return self.nodes.isEmpty
    }
    
    func insert(_ data: T) {
        var index = nodes.count
        nodes.append(data)
        
        while index >= 0 && sort(nodes[index], nodes[(index-1) / 2]) {
            nodes.swapAt(index, (index-1) / 2)
            index = (index-1) / 2
        }
    }
    
    func delete() -> T {
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let data = nodes.first!
        nodes.swapAt(0, nodes.count - 1)
        nodes.removeLast()
        
        let limit = nodes.count
        var index = 0
        
        while index < limit {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1
            
            let children = [leftChild, rightChild]
            .filter { $0 < limit && sort(nodes[$0], nodes[index]) }
            .sorted { sort(nodes[$0], nodes[$1]) }
            
            if children.isEmpty { break }
            nodes.swapAt(index, children.first!)
            index = children.first!
        }
        
        return data
    }
}

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var answer = 0
    var picks = picks
    var canMinerals = [String]() // 실질적으로 캘 수 있는 미네랄
    
    let heap = Heap<NodePriority>(sort: > )
    
    var idx = 0
    while idx < minerals.count && idx < 5 * picks.reduce(0, +) {
        canMinerals.append(minerals[idx])
        idx += 1
    }
    
    idx = 0
    while idx < canMinerals.count {
        var group = [String]()
        var tmp = 0
        for i in 0..<5 {
            if i + idx >= canMinerals.count { break }
            group.append(canMinerals[i + idx])
            if canMinerals[i+idx] == "diamond" {
                tmp += 25
            } else if canMinerals[i+idx] == "iron" {
                tmp += 5
            } else {
                tmp += 1
            }
        }
        
        heap.insert(NodePriority(tmp, group))
        idx += group.count
    }
    
    var pickIdx = 0
    while !heap.isEmpty {
        let popped = heap.delete()
        let group = popped.minerals
        
        while picks[pickIdx] == 0 {
            pickIdx += 1
        }
        
        for g in group {
            if g == "diamond" {
                if pickIdx == 0 {
                    answer += 1
                } else if pickIdx == 1 {
                    answer += 5
                } else {
                    answer += 25
                }
            } else if g == "iron" {
                if pickIdx == 2 {
                    answer += 5
                } else {
                    answer += 1
                }
            } else {
                answer += 1
            }
        }
        
        picks[pickIdx] -= 1
    }
    
    return answer
}