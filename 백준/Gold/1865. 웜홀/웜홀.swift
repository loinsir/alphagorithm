let tc = Int(readLine()!)!

var distances = [Int]()
var edges = [[Int]]()
var answer = ""

var n = 0, m = 0, w = 0
for _ in 0..<tc {
    let nmw = readLine()!.split(separator: " ").map { Int(String($0))! }
    (n, m, w) = (nmw[0], nmw[1], nmw[2])

    edges = [[Int]]()
    for _ in 0..<m {
        let set = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (s, e, t) = (set[0], set[1], set[2])
        edges.append([s, e, t])
        edges.append([e, s, t])
    }
    
    for _ in 0..<w {
        let set = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (s, e, t) = (set[0], set[1], set[2])
        edges.append([s, e, -t])
    }

    var flag = false
    for i in 1...n {
        if belmanFord(i) {
            flag = true
            break
        }
    }

    answer += flag ? "YES\n" : "NO\n"
}

print(answer)

func belmanFord(_ start: Int) -> Bool {
    distances = [Int](repeating: Int.max, count: n+1)
    distances[start] = 0
    var visitedFlag = false

    for v in 1..<n {
        visitedFlag = false
        for i in 0..<2*m+w {
            let currentNode = edges[i][0]
            let nextNode = edges[i][1]
            let cost = edges[i][2]

            if distances[currentNode] != Int.max && distances[nextNode] > distances[currentNode] + cost {
                distances[nextNode] = distances[currentNode] + cost
                visitedFlag = true
            }
        }

        if !visitedFlag {
            break
        }
    }

    if visitedFlag {
        for i in 0..<2*m+w {
            let currentNode = edges[i][0]
            let nextNode = edges[i][1]
            let cost = edges[i][2]

            if distances[currentNode] != Int.max && distances[nextNode] > distances[currentNode] + cost {
                return true
            }
        }
    }

    return false
}