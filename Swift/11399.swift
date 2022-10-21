let N = Int(readLine()!)!
var p = readLine()!.split(separator: " ").map { Int(String($0))! }

p.sort(by: < )

var sum = 0
var sumArr = Array(repeating: 0, count: N)

for i in p.enumerated() {
    sumArr[i.0] = i.1 + sum
    sum += i.1
}

print(sumArr.reduce(0) { $0 + $1 })
