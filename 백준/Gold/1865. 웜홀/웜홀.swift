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

    answer += belmanFord(1) ? "YES\n" : "NO\n"
}

print(answer)

func belmanFord(_ start: Int) -> Bool {
    distances = [Int](repeating: 10001, count: n+1)
    distances[start] = 0

    for v in 1...n {
        for i in 0..<2*m+w {
            let currentNode = edges[i][0]
            let nextNode = edges[i][1]
            let cost = edges[i][2]

            if distances[nextNode] > distances[currentNode] + cost {
                distances[nextNode] = distances[currentNode] + cost
                if v == n { return true }
            }
        }
    }

    return false
}