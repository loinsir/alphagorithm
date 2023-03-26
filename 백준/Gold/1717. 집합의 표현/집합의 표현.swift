let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var parents = Array(0...n)

func find(_ x: Int) -> Int {
    if parents[x] == x {
        return x
    } else {
        let rootX = find(parents[x])
        parents[x] = rootX
        return rootX
    }
}

func union(_ x: Int, _ y: Int) {
    let u = find(x)
    let v = find(y)
    
    if u < v {
        parents[v] = u
    } else {
        parents[u] = v
    }
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let oper = input[0], x = input[1], y = input[2]
    
    if oper == 0 {
        union(x, y)
    } else if oper == 1 {
        print(find(x) == find(y) ? "YES" : "NO")
    }
}