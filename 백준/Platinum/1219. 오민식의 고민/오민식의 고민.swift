let nsdm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, s, d, m) = (nsdm[0], nsdm[1], nsdm[2], nsdm[3])

var edges = [Int: [[Int]]]()
for _ in 0..<m {
    let t = readLine()!.split(separator: " ").map { Int(String($0))! }
    edges[t[0], default: []].append([t[1], t[2]])
}

let earns = readLine()!.split(separator: " ").map { -Int(String($0))! }

var pEdges = [Int: [[Int]]]()
for (node, value) in edges {
    for v in value {
        pEdges[node, default: []].append([v[0], v[1] + earns[v[0]]])
    }
}

belmanFord()

func belmanFord() {
    var distances = [Int](repeating: Int.max, count: n)
    distances[s] = earns[s]

    for r in 1..<n {
        for (node, pedges) in pEdges {
            if distances[node] != Int.max {
                for pedge in pedges {
                    if distances[pedge[0]] > distances[node] + pedge[1] {
                        distances[pedge[0]] = distances[node] + pedge[1]
                    }
                }
            }
        }
    }

    let earnedMoney = distances[d]
    if earnedMoney == Int.max { // gg
        print("gg")
        return
    }

    var cycleNodes = [Int]()
    for (node, pedges) in pEdges {
        if distances[node] != Int.max {
            for pedge in pedges {
                if distances[pedge[0]] > distances[node] + pedge[1] {
                    distances[pedge[0]] = distances[node] + pedge[1]
                    cycleNodes.append(pedge[0])
                }
            }
        }
    }

    var visited = [Bool](repeating: false, count: n)
    while let cycleNode = cycleNodes.popLast() {
        if visited[cycleNode] { continue }
        visited[cycleNode] = true

        var q = [cycleNode]
        var idx = 0

        while idx < q.count {
            let popped = q[idx]
            
            if popped == d {
                print("Gee")
                return
            }

            for pedge in pEdges[popped, default: []] {
                let nextNode = pedge[0]
                if !visited[nextNode] {
                    visited[nextNode] = true
                    q.append(nextNode)
                }
            }
            idx += 1
        }
    }

    print(-earnedMoney)
}