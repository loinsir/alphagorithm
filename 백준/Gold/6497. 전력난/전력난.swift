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
var edges = [[Int]]()
var answer = ""
var parent = [Int]()

while true {
    let m = file.readInt()
    let n = file.readInt()

    if m == 0 && n == 0 { break }

    parent = [Int](repeating: 0, count: m+1)
    for i in 0..<m {
        parent[i] = i
    }

    edges = [[Int]]()
    for _ in 0..<n {
        let x = file.readInt(), y = file.readInt(), z = file.readInt()
        edges.append([x, y, z])
    }
    kruskal()
}

print(answer)

func kruskal() {
    edges.sort(by: { $0[2] < $1[2] })
    var tmpAnswer = 0

    for edge in edges {
        if find(edge[0]) != find(edge[1]) {
            union(edge[0], edge[1])
        } else {
            tmpAnswer += edge[2]
        }
    }
    answer += "\(tmpAnswer)\n"
}

func find(_ x: Int) -> Int {
    if parent[x] == x {
        return x
    }

    parent[x] = find(parent[x])
    return parent[x]
}

func union(_ x: Int, _ y: Int) {
    let parentX = parent[x]
    let parentY = parent[y]

    if parentX == parentY {
        return
    }

    if parentX < parentY {
        parent[parentY] = parentX
    }  else {
        parent[parentX] = parentY
    }
}