import Foundation

let k = Int(readLine()!)!

let arr = readLine()!.components(separatedBy: " ").map { Int($0)! }
var answer = [[Int]](repeating: [Int](), count: k)

func find(_ left: Int, _ right: Int, _ level: Int) {
    if left > right { return }
    let mid = (left + right) / 2
    answer[level].append(arr[mid])
    find(left, mid-1, level+1)
    find(mid+1, right, level+1)
}

find(0, arr.count - 1, 0)

answer.forEach {
    print($0.map { String($0) }.joined(separator: " "))
}