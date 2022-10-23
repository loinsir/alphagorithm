let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]

var unlisten: Set<String> = []
var unseen: Set<String> = []
for _ in 1...N {
    unlisten.insert(readLine()!)
}

for _ in 1...M {
    unseen.insert(readLine()!)
}

let inter = unlisten.intersection(unseen)
print(inter.count)
for i in inter.sorted() {
    print(i)
}