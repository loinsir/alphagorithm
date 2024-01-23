let n = Int(readLine()!)!
var parent = [Int](repeating: 0, count: n+1)
for i in 1...n {
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

for _ in 0..<n-2 {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b) = (input[0], input[1])
    union(a, b)
}
var number = [Int](repeating: 0, count: 2)
var idx = 0
for i in 1...n {
    if parent[i] == i {
        number[idx] = i
        idx += 1
    }
}

print(number[0], number[1])