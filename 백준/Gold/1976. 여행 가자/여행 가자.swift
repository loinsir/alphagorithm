let N = Int(readLine()!)!
let M = Int(readLine()!)!

var parents = Array(0..<N)

func find(_ x: Int) -> Int {
    if parents[x] == x {
        return x
    } else {
        let root = find(parents[x])
        parents[x] = root
        return root
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

for x in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for y in x+1..<N {
        if input[y] == 1 {
            union(x, y)
        }
    }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var root = find(input[0]-1)
var answer = "YES"
for i in 1..<input.count {
    if root != find(input[i]-1){
        answer = "NO"
        break
    }
}
print(answer)