import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var parents = Array(0..<n)

func find(_ x: Int) -> Int {
    if x == parents[x] {
        return x
    } else {
        let y = find(parents[x])
        parents[x] = y
        return y
    }
}

func union(_ x: Int, _ y: Int) {
    let u = find(x)
    let v = find(y)
    
    if u != v {
        parents[u] = v
    }
}

var answer = 0
for i in 1...m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    var u = input.first!
    var v = input.last!
    
    let x = find(u)
    let y = find(v)
    
    if x == y {
        answer = i
        break
    } else {
        union(x, y)
    }
}

print(answer)