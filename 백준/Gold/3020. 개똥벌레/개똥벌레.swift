import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, h) = (input[0], input[1])
var stal = [Int]()
var opStal = [Int]()

for i in 0..<n {
    let s = Int(readLine()!)!
    if i % 2 == 0 {
        stal.append(s)
    } else {
        opStal.append(s)
    }
}

stal.sort()
opStal.sort()

func binary(_ arr: [Int], _ target: Int, _ isUpper: Bool) -> Int {
    var low = 0
    var high  = arr.count

    while low < high {
        let mid = (low + high) / 2
        if target == arr[mid] {
            isUpper ? (low = mid+1) : (high = mid)
        } else if target < arr[mid] {
            high = mid
        } else {
            low = mid + 1
        }
    }

    return low
}

var minTable = [Int: Int]()
var minKey = Int.max

for i in 1...h {
    var count = stal.count - binary(stal, i, false)
    count += opStal.count - binary(opStal, h - i, true)

    if minTable.keys.contains(count) {
        minTable[count]! += 1
    } else {
        minTable[count] = 1

        if count < minKey {
            minKey = count
        }
    }
}

print(minKey, minTable[minKey]!)