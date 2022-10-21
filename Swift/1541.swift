let input = readLine()!.split(separator: "-").map { String($0) }

var sumArr: [Int] = []
for i in input {
    let sum = i.split(separator: "+").map { Int(String($0))! }.reduce(0) { $0 + $1 }
    sumArr.append(sum)
}

print(sumArr[1...].reduce(sumArr[0]) { $0 - $1 })