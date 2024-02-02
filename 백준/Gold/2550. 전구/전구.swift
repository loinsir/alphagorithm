import Foundation

let n = Int(readLine()!)!

let switches = readLine()!.split(separator: " ").map { Int(String($0))! }
let lights = readLine()!.split(separator: " ").map { Int(String($0))! }

var indexDict = [Int: Int]()

for i in 0..<lights.count {
    indexDict[lights[i]] = i
}

var lis = [Int]()
var tracking = [[Int]]()

lis.append(indexDict[switches[0]]!)
tracking.append([1, switches[0]])

for i in 1..<n {
    let index = indexDict[switches[i]]!
    
    if lis.last! < index {
        lis.append(index)
        tracking.append([lis.count, switches[i]])
    } else {
        var start = 0, end = lis.count

        while start < end {
            let mid = (start + end) / 2

            if lis[mid] < index {
                start = mid + 1
            } else {
                end = mid
            }
        }
        lis[end] = index
        tracking.append([end+1, switches[i]])
    }
}

print(lis.count)

var length = lis.count
var answer = [Int]()
for i in stride(from: tracking.count - 1, through: 0, by: -1) {
    if tracking[i][0] == length {
        answer.append(tracking[i][1])
        length -= 1
    }
}
print(answer.sorted().map { String($0) }.joined(separator: " "))