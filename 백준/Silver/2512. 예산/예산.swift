import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
let m = Int(readLine()!)!

var answer = 0
var s = 1, e = arr[n - 1]

if arr.reduce(0, +) <= m {
    answer = arr.last!
} else {
    while s <= e {
        let mid = (s + e) / 2
        let sum = arr.map { 
            if $0 > mid {
                return mid
            } else {
                return $0
            }
        }.reduce(0, +)
        
        if sum > m {
            e = mid - 1
        } else {
            s = mid + 1
            answer = mid
        }
    }
}

print(answer)