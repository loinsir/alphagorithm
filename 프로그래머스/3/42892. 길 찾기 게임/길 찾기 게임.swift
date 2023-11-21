import Foundation

var nodes = [[Int]]()
var nodeCount = 0

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    
    nodeCount = nodeinfo.count
    
    for (index, node) in nodeinfo.enumerated() {
        nodes.append([node[0], node[1], index + 1])
    }
    nodes.sort(by: {
        if $0[1] != $1[1] {
            return $0[1] > $1[1]
        }
        
        return $0[0] < $1[0]
    })
    
    return [preorder(0, Array(0..<nodeCount)), postorder(0, Array(0..<nodeCount))]
}

func postorder(_ index: Int, _ targetArr: [Int]) -> [Int] {
    let root = nodes[index]
    let rootX = root[0], rootY = root[1], idx = root[2]
    
    var lefts = [Int]()
    var rights = [Int]()
    
    for i in 0..<targetArr.count {
        if nodes[targetArr[i]][0] < rootX && nodes[targetArr[i]][1] < rootY {
            lefts.append(targetArr[i])
        }
    }
    
    for i in 0..<targetArr.count {
        if nodes[targetArr[i]][0] > rootX && nodes[targetArr[i]][1] < rootY {
            rights.append(targetArr[i])
        }
    }

    var result = [Int]()
    
    if !lefts.isEmpty {
        result += postorder(lefts[0], lefts)
    }
    
    if !rights.isEmpty {
        result += postorder(rights[0], rights)
    }
    
    result += [idx]
    
    return result
}

func preorder(_ index: Int, _ targetArr: [Int]) -> [Int] {
    let root = nodes[index]
    let rootX = root[0], rootY = root[1], idx = root[2]
    
    var lefts = [Int]()
    var rights = [Int]()
    
    for i in 0..<targetArr.count {
        if nodes[targetArr[i]][0] < rootX && nodes[targetArr[i]][1] < rootY {
            lefts.append(targetArr[i])
        }
    }
    
    for i in 0..<targetArr.count {
        if nodes[targetArr[i]][0] > rootX && nodes[targetArr[i]][1] < rootY {
            rights.append(targetArr[i])
        }
    }

    var result = [idx]
    
    if !lefts.isEmpty {
        result += preorder(lefts[0], lefts)
    }
    
    if !rights.isEmpty {
        result += preorder(rights[0], rights)
    }
    
    return result
}