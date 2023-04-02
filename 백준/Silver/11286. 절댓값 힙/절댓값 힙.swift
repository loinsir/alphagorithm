final class Heap<T: Comparable> {
    private var nodes: [T] = []
    private let sort: (T, T) -> Bool
    
    init(sort: @escaping ((T, T) -> Bool)) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        nodes.isEmpty
    }
    
    func insert(_ data: T) {
        var index = nodes.count
        nodes.append(data)
        
        while index >= 0, sort(nodes[index], nodes[(index-1) / 2]) {
            nodes.swapAt(index, (index-1) / 2)
            index = (index-1) / 2
        }
    }
    
    func delete() -> T {
        if nodes.count == 1 {
            return nodes.removeFirst()
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

let heap = Heap<Int>(sort: { 
    if abs($0) == abs($1) { 
        return $0 < $1 
    } else {
        return abs($0) < abs($1)
    }
})

let N = Int(readLine()!)!

for _ in 0..<N {
    let input = Int(readLine()!)!
    switch input {
        case 0:
        if heap.isEmpty {
            print(0)
        } else {
            print(heap.delete())
        }
        default:
        heap.insert(input)
    }
}
