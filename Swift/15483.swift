let A: String = readLine()!
let B: String = readLine()!

var E: [[Int]] = Array(repeating: Array(repeating: Int.max, count: B.count+1), count: A.count+1)

for i in 0...A.count {
    E[i][0] = i
}

for j in 0...B.count {
    E[0][j] = j
}

for i in 1...A.count {
    for j in 1...B.count {
        let alpha = A[String.Index(encodedOffset: i - 1)] == B[String.Index(encodedOffset: j - 1)] ? 0 : 1
        E[i][j] = [E[i][j-1]+1, E[i-1][j]+1, E[i-1][j-1] + alpha].min()!
    }
}

print(E[A.count][B.count])