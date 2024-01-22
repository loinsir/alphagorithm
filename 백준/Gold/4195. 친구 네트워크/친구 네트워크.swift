let t = Int(readLine()!)!

var parent = [String: String]()
var rank = [String: Int]()

func find(_ x: String) -> String {
    if parent[x] == x {
        return x
    }
    
    parent[x] = find(parent[x]!)
    return parent[x]!
}

func union(_ x: String, _ y: String) {
    let parentX = find(x)
    let parentY = find(y)
    
    if parentX == parentY {
        return
    }
    
    if rank[parentX]! < rank[parentY]! {
        rank[parentY]! += rank[parentX]!
        parent[parentX]! = parentY
    } else {
        rank[parentX]! += rank[parentY]!
        parent[parentY]! = parentX
    }
}

for _ in 0..<t {
    let f = Int(readLine()!)!
    parent = [String: String]()
    
    for _ in 0..<f {
        let input = readLine()!.split(separator: " ").map { String($0) }
        let (a, b) = (input[0], input[1])
        
        if parent[a] == nil {
            parent[a] = a
            rank[a] = 1
        }
        
        if parent[b] == nil {
            parent[b] = b
            rank[b] = 1
        }
        
        union(a, b)
        print(rank[find(a)]!)
    }
}