import Foundation

let order = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m, n) = (input[0], input[1])

var arr1 = [Int]()
var arr2 = [Int]()

for i in 0..<m {
    let num = Int(readLine()!)!
    arr1.append(num)
}

for i in 0..<n {
    let num = Int(readLine()!)!
    arr2.append(num)
}

func sum(_ arr: [Int]) -> [Int: Int] {
    var table = [Int: Int]()
    for i in 0..<arr.count {
        var tmp = 0
        for j in i..<i+arr.count - 1 {
            tmp += arr[j % arr.count]
            table[tmp, default: 0] += 1
        }
    }
    table[arr.reduce(0, +), default: 0] += 1
    return table
}

let aTable = sum(arr1)
let bTable = sum(arr2)

let aComb = [Int](aTable.keys).sorted()
let bComb = [Int](bTable.keys).sorted()

var answer = 0

for a in aComb where a <= order {
    guard a != order else {
        answer += aTable[a]!
        break
    }

    if let b = binarySearch(order - a) {
        answer += aTable[a]! * bTable[b]!
    }
}

if let b = binarySearch(order), let bCase = bTable[b] {
    answer += bCase
}

func binarySearch(_ target: Int) -> Int? {
    var start = 0
    var end = bComb.count - 1

    while start <= end {
        let mid = (start + end) / 2

        if bComb[mid] == target {
            return bComb[mid]
        } else if target < bComb[mid] {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }

    return nil
}

print(answer)