let n = Int(readLine()!)!
var arr = [Int]()
var sets = Set<Int>()
for _ in 1...n {
    arr.append(Int(readLine()!)!)
}

arr.sort()

for i in arr {
    for j in arr {
        sets.insert(i + j)
    }
}

var answer = 0
var flag = false
for i in stride(from: n-1, through: 0, by: -1) {
    for j in 0..<i {
        if sets.contains(arr[i] - arr[j]) {
            answer = arr[i]
            flag = true
            break
        }
    }
    if flag { break }
}
print(answer)