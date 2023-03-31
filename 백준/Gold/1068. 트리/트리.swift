import Foundation

let N = Int(readLine()!)!

var tree = [Int: [Int]]()

for i in 0..<N {
    tree[i] = [Int]()
}
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let root = Int(input.firstIndex(of: -1)!)
for i in 0..<N {
    let parent = input[i]
    if parent == -1 { continue }
    tree[parent]!.append(i)
}

let remove = Int(readLine()!)!
var answer = 0

var visited = Array(repeating: 0, count: N)
func dfs(_ node: Int) {
    if node == remove {
        return
    }
    
    var flag = true
    for nod in tree[node]! {
        if visited[nod] == 0 && nod != remove {
            visited[nod] = 1
            flag = false
            dfs(nod)
        }
    }

    if flag {
        answer += 1
    }
}
visited[root] = 1
dfs(root)
print(answer)