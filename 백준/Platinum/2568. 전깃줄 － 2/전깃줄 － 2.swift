import Foundation

let n = Int(readLine()!)!
var index = [Int: Int]()
var arr = [Int]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(input[0])
    index[input[0]] = input[1]
}
arr.sort()
var lis = [Int]()
var tracking = [[Int]]()
lis.append(index[arr[0]]!)
tracking.append([1, arr[0]])

for i in 1..<n {
    let id = index[arr[i]]!

    if lis.last! < id {
        lis.append(id)
        tracking.append([lis.count, arr[i]])
    } else {
        var left = 0, right = lis.count
        
        while left < right {
            let mid = (left + right) / 2
            if lis[mid] < id {
                left = mid + 1
            } else {
                right = mid
            }
        }
        lis[right] = id
        tracking.append([right + 1, arr[i]])
    }
}

var answer = [Int]()
var len = lis.count
for i in stride(from: tracking.count - 1, through: 0, by: -1) {
    if len == tracking[i][0] {
        answer.append(tracking[i][1])
        len -= 1
    }
}

answer.reverse()
print(n - lis.count)
var result = [Int]()
var idx = 0

for i in 0..<n {
    if arr[i] != answer[idx] {
        result.append(arr[i])
    } else {
        idx = min(idx+1, answer.count - 1)
    }
}

print(result.sorted().map { String($0) }.joined(separator: "\n"))