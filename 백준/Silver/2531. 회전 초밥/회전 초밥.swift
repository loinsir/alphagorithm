import Foundation

let ndkc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, d, k, c) = (ndkc[0], ndkc[1], ndkc[2], ndkc[3])

var arr = [Int]()
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

var answer = 0
var dishes = [Int: Int]()

for i in 0..<k {
    dishes[arr[i], default: 0] += 1
    if dishes[c, default: 0] == 0 {
        dishes[c] = 1
    }
    answer = max(answer, dishes.keys.count)
}

for i in 0..<arr.count {
    dishes[arr[i], default: 0] -= 1
    if dishes[arr[i], default: 0] == 0 {
        dishes[arr[i]] = nil
    }
    
    dishes[arr[(i + k) % n], default: 0] += 1
    if dishes[c, default: 0] == 0 {
        dishes[c] = 1
    }
    answer = max(answer, dishes.keys.count)
}

print(answer)