let input = readLine()!.split(separator: " ").map {Int($0)!}
let N = input[0]
let K = input[1]
var list: [Int] = []

for i in 1...N {
    if N % i == 0 {
        list.append(i)
    }
}
if list.count < K {
    print(0)
} else {
    print(list[K-1])
}