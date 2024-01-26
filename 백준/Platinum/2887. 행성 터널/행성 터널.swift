let n = Int(readLine()!)!

var poses = [[Int]]()
var edges = [[Int]]()
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (x, y, z) = (input[0], input[1], input[2])
    poses.append([i, x, y, z])
}

poses.sort(by: { $0[1] < $1[1] })
for i in 0..<n-1 {
    let a = poses[i]
    let b = poses[i+1]

    edges.append([a[0], b[0], min(abs(a[1] - b[1]), abs(a[2] - b[2]), abs(a[3] - b[3]))])
}

poses.sort(by: { $0[2] < $1[2] })
for i in 0..<n-1 {
    let a = poses[i]
    let b = poses[i+1]

    edges.append([a[0], b[0], min(abs(a[1] - b[1]), abs(a[2] - b[2]), abs(a[3] - b[3]))])
}

poses.sort(by: { $0[3] < $1[3] })
for i in 0..<n-1 {
    let a = poses[i]
    let b = poses[i+1]

    edges.append([a[0], b[0], min(abs(a[1] - b[1]), abs(a[2] - b[2]), abs(a[3] - b[3]))])
}


var parent = [Int](repeating: 0, count: n)
for i in 0..<n {
    parent[i] = i
}

func find(_ x: Int) -> Int {
    if parent[x] == x {
        return x
    }
    
    parent[x] = find(parent[x])
    return parent[x]
}

func union(_ x: Int, _ y: Int) {
    let parentX = find(x)
    let parentY = find(y)

    parent[parentY] = parentX
}

var answer = 0
func kruskal() {
    edges.sort(by: { $0[2] < $1[2] })

    for edge in edges {
        let x = edge[0], y = edge[1], weight = edge[2]

        if find(x) != find(y) {
            answer += weight
            union(x, y)
        }
    }
}

kruskal()
print(answer)