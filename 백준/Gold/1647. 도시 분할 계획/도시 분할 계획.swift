import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}

let file = FileIO()

let (n, m) = (file.readInt(), file.readInt())
var edges = [[Int]]()
var mst = [[Int]]()
for i in 0..<m {
    edges.append([file.readInt(), file.readInt(), file.readInt()])
}
edges.sort(by: { $0[2] < $1[2] })

var parent = [Int](repeating: 0, count: n+1)
for i in 1...n {
    parent[i] = i
}

kruskal()

func find(_ x: Int) -> Int {
    if parent[x] == x {
        return x
    }
    
    parent[x] = find(parent[x])
    return parent[x]
}

func union(_ x: Int, _ y: Int) -> Bool {
    let parentX = find(x)
    let parentY = find(y)
    
    if parentX == parentY {
        return false
    }
    
    parent[parentY] = parentX
    return true
}
var totalCost = 0
var maxCost = 0

func kruskal() {
    
    for edge in edges {
        if union(edge[0], edge[1]) {
            totalCost += edge[2]
            maxCost = max(maxCost, edge[2])
        }
    }

    print(totalCost - maxCost)
}