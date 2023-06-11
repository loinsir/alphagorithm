import Foundation

let N = Int(readLine()!)!
let K = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()

var distances = [Int]()
for i in 1..<arr.count {
    distances.append(arr[i] - arr[i-1])
}

distances.sort(by: > )

if K >= N {
    print(0)
    exit(0)
}

for _ in 0..<K-1 {
    distances.removeFirst()
}

print(distances.reduce(0, +))