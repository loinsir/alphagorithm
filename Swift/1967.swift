let n = Int(readLine()!)!

var graph: [[(Int, Int)]] = Array(repeating: [], count: n+1)
var results = Array(repeating: [Int: Int](), count: n+1)
for i in 1..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[input[0]].append((input[1], input[2]))
}


func dfs(_ root: Int, _ child: Int, _ node: Int, _ length: Int) {
    if graph[node].count == 0 {
        if let val = results[root][child] {
            if val < length {
                results[root].updateValue(length, forKey: child)
            }
        } else {
            results[root][child] = length
        }
        return
    }

    for (v, e) in graph[node] {
        dfs(root, child, v, length + e)
    }
}

for i in 1...n {
    for child in graph[i] {
        dfs(i, child.0, child.0, child.1)
    }
}

// dfs(1, 1, 0)
// print(results.map { Array($0.values).sorted(by: < ) })
var result = 0
for i in results.map { Array($0.values).sorted(by: > ) } {
    if i.count >= 2 {
        result = max(result, i[0] + i[1])
    } else if i.count == 1 {
        result = max(result, i[0])
    }
}
// print(results)
print(result)