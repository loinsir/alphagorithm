let N = Int(readLine()!)!
var graph: [String: [String]] = [:]

var pre: [String] = []
var inorder: [String] = []
var post: [String] = []

for i in 1...N {
    let input = readLine()!.split(separator: " ").map{String($0)}
    graph.updateValue([input[1], input[2]], forKey: input[0])
}

func pre(_ node: String) {
    pre.append(node)

    for i in graph[node]! {
        if i != "." {
            pre(i)
        }
    }
}

func inorder(_ node: String) {
    if let childs = graph[node] {
        if childs[0] != "." {
            inorder(childs[0])
        }
    }
    inorder.append(node)
    if let childs = graph[node] {
        if childs[1] != "." {
            inorder(childs[1])
        }
    }
}

func post(_ node: String) {
    for i in graph[node]! {
        if i != "." {
            post(i)
        }
    }
    post.append(node)
}

pre("A")
inorder("A")
post("A")

print(pre.joined(separator: ""))
print(inorder.joined(separator: ""))
print(post.joined(separator: ""))