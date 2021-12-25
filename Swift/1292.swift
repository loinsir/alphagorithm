let input = readLine()!.split(separator: " ").map {Int($0)!}
let A = input[0]
let B = input[1]
var arr: [Int] = []

for i in 1...B {
    for _ in 1...i {
        arr.append(i)
    }
}

var sum = 0
for i in A-1..<B {
    sum += arr[i]
}

print(sum)