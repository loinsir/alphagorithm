import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var lis = [Int]()
var track = [[Int]]()
lis.append(arr[0])
track.append([1, arr[0]])

for i in 1..<n {
    if lis.last! < arr[i] {
        lis.append(arr[i])
        track.append([lis.count, arr[i]])
    } else {
        var left = 0, right = lis.count
        
        while left < right {
            let mid = (left + right) / 2
            
            if lis[mid] < arr[i] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        lis[right] = arr[i]
        track.append([right+1, arr[i]])
    }
}

var length = lis.count
var answer = [Int]()

for i in stride(from: track.count - 1, through: 0, by: -1) {
    if length == track[i][0] {
        answer.append(track[i][1])
        length -= 1
    }
}

print(lis.count)
print(answer.reversed().map { String($0) }.joined(separator: " "))