let input1 = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input1[0], M = input1[1]
var A = [[Int]]()
for i in 0..<N {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    A.append(input)
}

let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
let K = input2[1]
var B = [[Int]]()
for i in 0..<M {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    B.append(input)
}

var C = Array(repeating: Array(repeating: 0, count: K), count: N)
for n in 0..<N {
    for k in 0..<K {
        var sum = 0
        for m in 0..<M {
            sum += A[n][m] * B[m][k]
        }
        C[n][k] = sum
    }
}

for i in 0..<N {
    print(C[i].map{String($0)}.joined(separator: " "))
}